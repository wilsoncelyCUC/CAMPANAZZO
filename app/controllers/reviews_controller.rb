class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    find_post
    find_profile(@post)
    find_my_profession(@post, @profile_worker)
    @review.profile = @profile_worker
    @review.post = @post
    @review.my_profession= @my_profession
    if @review.save
      redirect_to profile_path(@profile)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  private
    def review_params
      params.require(:review).permit(:score, :description, :profile_id, :post_id, my_profession_id:)
    end


    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_profile(post)
      @profile_worker = Profile.find(post.reservations.first.profile_id)
    end



    def find_my_profession(post, profile_worker)
      @my_profession = MyProfession.where(profession_id: post.profession.id ,  profile_id: profile_worker.id)
    end

end
