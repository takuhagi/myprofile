class CreatePrs < ActiveRecord::Migration[6.0]
  def change
    create_table :prs do |t|
      t.string :src
      t.string :pr_url
      t.timestamps
    end
  end
end
