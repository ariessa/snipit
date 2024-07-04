class ChangeGeolocationToStringInViews < ActiveRecord::Migration[7.1]
  def change
    change_column :views, :geolocation, :string
  end
end
