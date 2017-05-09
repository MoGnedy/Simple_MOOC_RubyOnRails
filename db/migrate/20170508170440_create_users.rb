class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.date :dob
      t.string :image
      t.belongs_to :role, foreign_key: true, default: 'Student'
      t.timestamps
    end
  end
end
