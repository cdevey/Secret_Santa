class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.text :location
      t.datetime :when
      t.text :swap_description

      t.timestamps null: false
    end
  end
end
