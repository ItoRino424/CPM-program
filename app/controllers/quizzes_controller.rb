class QuizzesController < ApplicationController
    def index
        @quizzes = Quiz.all
    end

    def new
        @quizzes = Quiz.new
    end

    def create
        @quizzes = Quiz.new(title: params[:title], correct_answer: params[:correct_answer])
          if @quizzes.save
          flash[:notice] ="クイズを投稿しました。" 
          redirect_to("/quizzes/#{@quizzes.id}")
        else
          render("/quizzes/new")
        end
    end

    def show
        @quizzes = Quiz.find_by(id: params[:id])
      end

    def answer_quiz
        quiz = Quiz.find(params[:id])
        user = current_user
    
        if params[:answer].to_i == quiz.correct_answer
          # 正解の場合、ユーザーに得点を付与する
          user.rankings.create(score: quiz.correct_answer)
          redirect_to quizzes_path, notice: 'Correct answer! You earned points.'
        else
          redirect_to quizzes_path, alert: 'Incorrect answer.'
        end
      end
end
