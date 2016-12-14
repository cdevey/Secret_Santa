class SwapsController < ProtectedController
  before_action :set_swap, only: [:show, :edit, :update, :destroy, :autoassign]
  before_action :require_ownership, only: [:new, :create, :update, :edit, :destroy]

  # GET /swaps
  # GET /swaps.json
  def index
    @swaps = Swap.all
  end

  # GET /swaps/1
  # GET /swaps/1.json
  def show
    @users = @swap.users
    @recipient = Recipient.find_by(swap_id: @swap.id, user_id: @current_user)
  end

  # GET /swaps/new
  def new
    @swap = Swap.new
  end

  def autoassign
    # create an empty list of current recipients. adding id of 0 for sql
    current_recipient_ids = [0]

    # loop through all swap users
    @swap.users.uniq.each do | user |

      # puts "getting person for #{user}"

      # pick out all available users (not the current user in list and not yet assigned)
      available_recipients = @swap.users.where("users.id <> ? AND users.id NOT IN (?)", user.id, current_recipient_ids)

      # puts "found recipients:: #{available_recipients.inspect}"
      # puts "current recipients are #{current_recipient_ids}"

      # if a user if found, create the recipient with current user in the loop
      r = Recipient.create!(swap: @swap, user: user, recipient: available_recipients.sample) if available_recipients.any?
      # add this recipient to the array so they don't get chosen again
      current_recipient_ids << r.recipient_id


    end

    flash[:message]= "Recipients have been assigned"
    redirect_to swap_path(@swap)
  end

#trying to make the path to add a swap
#  def add
#    @swap = Swap.add
#  end

  # GET /swaps/1/edit
  def edit
  end

  # POST /swaps
  # POST /swaps.json
  def create
    @swap = Swap.new(swap_params)

    respond_to do |format|
      if @swap.save
        format.html { redirect_to @swap, notice: 'Swap was successfully created.' }
        format.json { render :show, status: :created, location: @swap }
      else
        format.html { render :new }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swaps/1
  # PATCH/PUT /swaps/1.json
  def update
    respond_to do |format|
      if @swap.update(swap_params)
        format.html { redirect_to @swap, notice: 'Swap was successfully updated.' }
        format.json { render :show, status: :ok, location: @swap }
      else
        format.html { render :edit }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swaps/1
  # DELETE /swaps/1.json
  def destroy
    @swap.destroy
    respond_to do |format|
      format.html { redirect_to swaps_url, notice: 'Swap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swap
      @swap = Swap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swap_params
      params.require(:swap).permit(:location, :when, :swap_description)
    end
end
