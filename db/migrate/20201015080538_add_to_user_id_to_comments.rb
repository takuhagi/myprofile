class AddToUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :commenter_id, :integer
  end
end
