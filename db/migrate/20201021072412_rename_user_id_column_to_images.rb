class RenameUserIdColumnToImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :images, :profile, index: true
    remove_column :images, :user_id, :string
  end
end
