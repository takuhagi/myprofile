class AddColorToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :color, :string
  end
end
