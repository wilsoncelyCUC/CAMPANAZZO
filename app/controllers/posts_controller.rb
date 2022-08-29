class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    find_profile_customer
    @post= Post.new(post_params)
    #byebug
    @post.profile_id = @profile_customer.id
    @post.profession_id = Profession.last.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def find_profile_customer
    # When you log up, a new user is created, however, a profile_id is required for the post creation. This method creates a profile_id when the current_user does not have one.
    if Profile.find_by(user_id: current_user)
      @profile_customer = Profile.find_by(user_id: current_user)
    else
      # Create a Profile_id for the user (type customer)
      @profile_customer = Profile.new(user_id: current_user.id)
      @profile_customer.save
    end
  end

  def post_params
    params.require(:post).permit(:name, :date, :description, :url_video, :photo, :profession_id, :address, :available_48,:transport, :validated, :quick_assessment)
  end
end
