class ChangeColumnsOfLocations < ActiveRecord::Migration[6.1]
  def change
    change_column_null :locations, :country, false
    change_column_null :locations, :city, false
  end
end
