class Addactualdateofreturntobookissues < ActiveRecord::Migration
  def up
    add_column :bookissues, :date_of_actual_return, :datetime, default: nil
  end

  def down
    remove_column :bookissues, :date_of_actual_return
  end
end
