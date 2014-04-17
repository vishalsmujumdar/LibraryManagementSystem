class CreateBookissues < ActiveRecord::Migration
  def change
    create_table :bookissues do |t|
      t.references :user, index: true
      t.references :bookitem, index: true
      t.datetime :date_of_issue
      t.datetime :date_of_return

      t.timestamps
    end
  end
end

#rails g model Bookissue user:references bookitem:references date_of_issue:datetime date_of_return:datetime