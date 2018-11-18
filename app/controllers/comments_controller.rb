class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    authorize @comment
  end

  def edit
  end

  def show
  end

  def update
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    authorize @comment

    if @comment.save
      puts "saved"
      redirect_to post_path(@post), notice: "Comment was created"
    else
      puts "not saved"
      render :new
    end
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
