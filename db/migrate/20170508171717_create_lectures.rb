class CreateLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :lectures do |t|
      t.string :content
      t.string :attachment
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
