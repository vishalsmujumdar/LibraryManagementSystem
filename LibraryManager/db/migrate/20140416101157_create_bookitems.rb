class CreateBookitems < ActiveRecord::Migration
  def change
    create_table :bookitems do |t|
      t.boolean :availability
      t.belongs_to :user
      t.references :book, index: true

      t.timestamps
    end
  end
end

# rails g model Bookitem isbn:string availability:string user:references book:references