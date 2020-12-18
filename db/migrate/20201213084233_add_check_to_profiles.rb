class AddCheckToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :top, :boolean, default: false
    add_column :profiles, :middle, :boolean, default: false
    add_column :profiles, :bottom, :boolean, default: false
  end
end
