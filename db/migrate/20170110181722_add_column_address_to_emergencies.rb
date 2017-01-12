class AddColumnAddressToEmergencies < ActiveRecord::Migration[5.0]
  def change
    add_column :emergencies, :address, :string
    add_column :emergencies, :lat, :decimal, precision: 15, scale: 13
    add_column :emergencies, :lng, :decimal, precision: 15, scale: 13
  end
end
