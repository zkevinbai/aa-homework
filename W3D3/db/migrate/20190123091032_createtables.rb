class Createtables < ActiveRecord::Migration[5.2]
  def change
    create_table :person do |t|
      t.string :name, null: false
      t.integer :house_id
      t.timestamps
    end

    create_table :house do |t|
      t.string :address, null: false 
      t.timestamps
    end
  end
end
