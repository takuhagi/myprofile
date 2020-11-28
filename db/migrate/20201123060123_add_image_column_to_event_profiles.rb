class AddImageColumnToEventProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :event_profiles, :image, :string
  end
end
