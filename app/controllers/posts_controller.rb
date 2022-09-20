class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    find_profile_customer
    @posts = Post.all
    @my_posts_current = Post.where('date >= ? AND profile_id = ?' , DateTime.now,  @profile_customer.id )
    @my_posts_past = Post.where('date < ? AND profile_id = ?' , DateTime.now,  @profile_customer.id )

    def filter_by_type
      @posts = Post.where(state: params[:type_filter])
      render partial: 'shared/cards-posts', locals: { posts: posts }
    end


  end

  def new
    @post = Post.new
    session[:profession_name] = params[:search][:query] #storing the input from form-start into the session variable

  end

  def create
    find_profile_customer
    @post= Post.new(post_params)
    profession = get_profession(session[:profession_name])
    @post.profession_id = profession ?  profession.id : nil
    @post.profile_id = @profile_customer.id
    @post.profession_id = Profession.last.id
    @post.name = "Servicio de #{profession.name}"
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

  def get_profession(element)
    #Temp Hard-code, if the profession isn't found then it return cleaning.
    #correction will be provided an autocomplete list_of_profession in the homepage bar
    Profession.find_by(name: element) ? Profession.find_by(name: element) : Profession.find_by(name: 'Limpieza')
  end

  def find_post
    @post = Post.find(params[:id])
  end

  # When you log up, a new user is created, however, a profile_id is required for the post creation. This method creates a profile_id when the current_user does not have one.
  def find_profile_customer
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
