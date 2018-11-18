class PostsController < ApplicationController

  def index
    @posts = policy_scope(Post)
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post

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
