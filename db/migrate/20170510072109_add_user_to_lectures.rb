class AddUserToLectures < ActiveRecord::Migration[5.0]
  def change
    add_reference :lectures, :user, foreign_key: {on_delete: :cascade}
  end
end
