class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :difficulty
      t.boolean :public

      t.timestamps
    end
  end
end
