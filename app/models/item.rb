class Item < ActiveRecord::Base
  belongs_to :user
  validates :item_description, :link, presence: true


end
