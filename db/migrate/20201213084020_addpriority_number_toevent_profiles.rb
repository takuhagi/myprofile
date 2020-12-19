class AddpriorityNumberToeventProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :event_profiles ,:priority_number, :integer
    add_index :event_profiles ,:priority_number, unique: true
  end
end
