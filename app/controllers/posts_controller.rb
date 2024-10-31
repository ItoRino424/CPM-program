class PostsController < ApplicationController

  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  protect_from_forgery except: :create
  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "応用問題を送信しました"
      redirect_to("/posts/index")
    else
      render("/posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  protect_from_forgery except: :update
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "応用問題を修正しました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

end