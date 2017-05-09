class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.belongs_to :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
