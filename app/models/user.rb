class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         ##クイズとランキングのデータベース内の連携
         has_many :quizzes
         has_many :rankings
    #validates :name,{presence:true}
  
    # emailカラムに関するバリデーションを作成してください
    #validates :email,{presence:true, uniqueness: true}
end
