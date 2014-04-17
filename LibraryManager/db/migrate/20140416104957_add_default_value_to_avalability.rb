class AddDefaultValueToAvalability < ActiveRecord::Migration
  def up
    change_column :bookitems, :availability, :boolean, :default => true
  end
end
