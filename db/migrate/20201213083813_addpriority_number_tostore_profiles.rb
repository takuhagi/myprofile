class AddpriorityNumberTostoreProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :store_profiles, :priority_number, :integer
    add_index :store_profiles, :priority_number, unique: true
  end
end
