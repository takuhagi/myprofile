class CreateEventImages < ActiveRecord::Migration[6.0]
  def change
    create_table :event_images do |t|
      t.references :event_profile, foreign_key: true
      t.string :src
      t.timestamps
    end
  end
end
