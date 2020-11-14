class AddStoreToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :store_name, :string
    add_column :profiles, :store_explanation, :text
    add_column :profiles, :store_image, :string
    add_column :profiles, :item_name, :string
    add_column :profiles, :item_explanation, :text
    add_column :profiles, :item_image, :string
    add_column :profiles, :service_name, :string
    add_column :profiles, :service_explanation, :text
    add_column :profiles, :service_image, :string
    add_column :profiles, :event_name, :string
    add_column :profiles, :event_explanation, :text
    add_column :profiles, :event_image, :string
    add_column :profiles, :event_place, :string
    add_column :profiles, :event_start, :datetime
    add_column :profiles, :event_end, :datetime
  end
end
