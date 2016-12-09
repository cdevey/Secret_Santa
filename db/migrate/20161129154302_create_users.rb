class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.string :password
      t.text :shipping_address
      t.boolean :organizer
      t.text :bio

      t.timestamps null: false
    end
  end
end
