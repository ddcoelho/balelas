class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    puts @post.user.email

    if @post.save
      puts "saved"
      redirect_to @post, notice: "Post was created"
    else
      puts "not saved"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end