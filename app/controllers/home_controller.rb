class HomeController < ProtectedController
  def index
    @swaps = @current_user.swaps
  end
end
