class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :item_description
      t.text :link

      t.timestamps null: false
    end
  end
end
