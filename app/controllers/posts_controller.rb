class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]

  def index
    find_profile_customer
    @posts = Post.all
    @my_posts_current = Post.joins(:reservations).where( profile_id:  @profile_customer.id ).where( "reservations.start_date >= ?", Date.today).references(:reservations)
    #@my_posts_current = Post.where('date >= ? AND profile_id = ?' , DateTime.now,  @profile_customer.id )
    @my_posts_past = Post.where('date < ? AND profile_id = ?' , DateTime.now,  @profile_customer.id )
  end

  def new
    @post = Post.new
    params.permit!

    #session[:profession_name] = params[:search].nil? ? '' : params[:search][:profession] #storing the input from form-start into the session variable
    session[:profession_name] = params[:profession_id].nil? ? '' : Profession.find(params[:profession_id]).name #storing the input from form-start into the session variable
    @profile_contratar_buttom = session[:selected_profile_worker_id].nil? ? '' : Profile.find(session[:selected_profile_worker_id])
  end

  def create
    find_profile_customer
    #case: Customer select a worker from its profile/show
    if !session[:selected_profile_worker_id].nil?
      @profile_worker = Profile.find(session[:selected_profile_worker_id])
      @post= Post.new(post_params)
      profession = Profession.find(@post.carrier) #ugly shit
      @post.profession = profession
      @post.profile_id = @profile_customer.id
      @post.name = profession.nil? ? 'Nuevo Servicio' : "Servicio de #{profession.name}"
      if @post.save
        session[:post_id] = @post.id
        #create reservation from post/new
        @reservation = Reservation.new(profile_id: @profile_worker.id, post_id: @post.id, start_date: @post.date )
        end_hour = @post.quick_assessment[0].nil? ? 1 : @post.quick_assessment[0].to_i
        @reservation.end_date = (@reservation.start_date + end_hour.hour).to_datetime
        @reservation.start_date = @reservation.start_date.to_datetime #validator only works with datetime and not with TimeToZone

        if @reservation.save!

          session[:post_id] = nil
          session[:flow_basic] = 'terminated'
          session[:selected_profile_worker_id] = nil
          redirect_to posts_path

        else
          redirect_to post_path
        end
      else
        render :new
      end

    else  #case: stardard case
      find_profile_customer
      @post= Post.new(post_params)
      profession = get_profession(session[:profession_name])
      @post.profession = profession
      @post.profile_id = @profile_customer.id
      if @post.save
        @post.name = "Servicio de #{profession.name}"
        session[:post_id] = @post.id
        redirect_to profiles_path
      else
        render :new
      end
    end





  end

  def show
    @buttons_show = true
    find_profile_worker(@post)
    if status_checker_past?(@post)
       if !@post.reservations.first.nil?
        reservation = @post.reservations.first
        reservation.status = 5
        @post.state = 5
        @reservation = reservation
        @buttons_show = false
       end
    else
      @reservation = @post.reservations.first.nil? ? nil : @post.reservations.first
    end
    @my_profession = MyProfession.where(profile_id: @profile_worker.id , profession_id: @post.profession_id ).first
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    find_post
    @post.reservations.delete_all
    @post.reviews.delete_all
    @post.delete
    redirect_to posts_path, status: :see_other
  end



  private

  def get_profession(element)
    #Temp Hard-code, if the profession isn't found then it returns cleaning.
    #correction will be provided an autocomplete list_of_profession in the homepage bar
    Profession.find_by(name: element) ? Profession.find_by(name: element) : nil
  end

  def set_profession(profession, post)
    if !profession.nil?
     post.profession_id = profession ? profession.id : nil
    else
      post.profession_id = Profession.last.id #To be dealed with, later:
    end
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

  def find_profile_worker(post)
    @profile_worker = post.reservations.first.profile.nil? ? nil : post.reservations.first.profile
  end

  def post_params
    params.require(:post).permit(:name, :date, :description, :url_video, :photo, :profession_id, :address, :available_48,:transport, :validated, :quick_assessment, :experienced, :carrier)
  end
end
