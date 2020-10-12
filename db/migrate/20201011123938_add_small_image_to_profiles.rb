class AddSmallImageToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :sub_image, :string
  end
end
