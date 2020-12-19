class AddpriorityNumberToitemProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :item_profiles, :priority_number, :integer
    add_index :item_profiles, :priority_number, unique: true
  end
end
