class AddImageColumnToServiceProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :service_profiles, :image, :string
  end
end
