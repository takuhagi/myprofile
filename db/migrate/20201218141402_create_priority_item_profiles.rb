class CreatePriorityItemProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :priority_item_profiles do |t|
      t.references :item_profile, unique: true
      t.integer :priority_number, unique: true
      t.timestamps
    end
  end
end
