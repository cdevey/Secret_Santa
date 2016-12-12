class Swap < ActiveRecord::Base

  def to_s
    "#{swap_description}"
  end

  validates :location, :when, :swap_description, presence: true



end
