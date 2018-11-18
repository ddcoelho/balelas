class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @post = Post.find(params[:post_id])
    @review.post = @post
    authorize @review

    if Review.where(user: current_user, post: @post).exists?
      redirect_to root_path, notice: "You already voted for that post"
    else
      if @review.save
        redirect_to root_path, notice: "Your vote has been added"
      else
        redirect_to root_path, notice: "Oops something went wrong"
      end
    end
  end

  private

  def review_params
     params.permit(:value, :post_id)
  end

end
