class CreatePriorityStoreProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :priority_store_profiles do |t|
      t.references :store_profile, unique: true
      t.integer :priority_number, unique: true
      t.timestamps
    end
  end
end
