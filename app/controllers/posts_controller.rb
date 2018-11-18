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
      redirect_to @post, notice: "Post was created"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    authorize @post

    redirect_to @post
  end

  def indexByUser
    @user = User.find(params[:id])
    @posts = @user.posts
    authorize @posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end

