class AddStatusToBookissues < ActiveRecord::Migration
  def up
    add_column :bookissues, :status, :boolean, default: false
  end

  def down
    remove_column :bookissues, :status
  end
end
