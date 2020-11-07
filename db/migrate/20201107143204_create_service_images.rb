class CreateServiceImages < ActiveRecord::Migration[6.0]
  def change
    create_table :service_images do |t|
      t.references :service_profile, foreign_key: true
      t.string :src
      t.timestamps
    end
  end
end
