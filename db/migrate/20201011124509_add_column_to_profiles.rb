class AddColumnToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :catch_copy, :string
    add_column :profiles, :avatar_title, :string
    add_column :profiles, :avatar_catch_copy, :string
    add_column :profiles, :avatar_about, :text
  end
end
