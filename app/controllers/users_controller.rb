class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
  @user = User.new
    
  end
  
  protect_from_forgery except: :create
  def create
    @user = User.new(name: params[:name], email: params[:email])
      if @user.save
      flash[:notice] ="ユーザー登録が完了しました" 
      redirect_to("/users/#{@user.id}")
    else
      render("/users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
end
