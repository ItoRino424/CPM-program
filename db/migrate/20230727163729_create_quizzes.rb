class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.integer :correct_answer

      #t.string :name
      #t.string :email
      t.timestamps
    end
  end
end
