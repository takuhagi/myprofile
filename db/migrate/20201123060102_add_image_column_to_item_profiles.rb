class AddImageColumnToItemProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :item_profiles, :image, :string
  end
end
