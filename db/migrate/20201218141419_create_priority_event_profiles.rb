class CreatePriorityEventProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :priority_event_profiles do |t|
      t.references :event_profile, unique: true
      t.integer :priority_number, unique: true
      t.timestamps
    end
  end
end
