class Swap < ActiveRecord::Base

  validates :location, :when, :swap_description, presence: true
  


end
