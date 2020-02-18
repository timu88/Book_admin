class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.date :publishd_on
      t.integer :price
      t.integer :number_of_page

      t.timestamps
    end
  end
end
