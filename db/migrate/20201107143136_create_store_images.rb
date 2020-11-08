class CreateStoreImages < ActiveRecord::Migration[6.0]
  def change
    create_table :store_images do |t|
      t.references :store_profile, foreign_key: true
      t.string :src
      t.timestamps
    end
  end
end
