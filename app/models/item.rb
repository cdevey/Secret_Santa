class Item < ActiveRecord::Base
  belongs_to :user

  validates :item_description, :link, presence: true

def description
  item_description
end

end
