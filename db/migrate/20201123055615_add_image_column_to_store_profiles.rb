class AddImageColumnToStoreProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :store_profiles, :image, :string
  end
end
