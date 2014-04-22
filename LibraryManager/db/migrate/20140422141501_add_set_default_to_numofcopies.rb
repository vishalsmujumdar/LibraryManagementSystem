class AddSetDefaultToNumofcopies < ActiveRecord::Migration
  def up
    change_column :books, :number_of_copies, :integer, :default => 0
  end
end
