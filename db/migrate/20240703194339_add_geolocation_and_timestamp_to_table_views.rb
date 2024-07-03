class AddGeolocationAndTimestampToTableViews < ActiveRecord::Migration[7.1]
  def change
    add_column :views, :geolocation, :jsonb
    add_column :views, :timestamp, :datetime
  end
end
