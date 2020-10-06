class CreateGenreProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_profiles do |t|
      t.references :genre, foreign_key: true
      t.references :profile, foreign_key: true
      t.timestamps
    end
  end
end
