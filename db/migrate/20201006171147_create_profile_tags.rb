class CreateProfileTags < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_tags do |t|
      t.references :tag, foreign_key: true
      t.references :profile, foreign_key: true
      t.timestamps
    end
  end
end
