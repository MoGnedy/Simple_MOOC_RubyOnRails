class AddUserToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :user, foreign_key: {on_delete: :cascade}
  end
end
