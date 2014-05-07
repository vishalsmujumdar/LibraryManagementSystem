class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.text :description
      t.string :category
      t.string :authors
      t.integer :number_of_copies
      
      t.timestamps
    end
  end
end
`