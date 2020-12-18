class CreatePriorityServiceProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :priority_service_profiles do |t|
      t.references :service_profile, unique: true
      t.integer :priority_number, unique: true
      t.timestamps
    end
  end
end
