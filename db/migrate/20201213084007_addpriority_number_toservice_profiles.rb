class AddpriorityNumberToserviceProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :service_profiles, :priority_number, :integer
    add_index :service_profiles, :priority_number, unique: true
  end
end
