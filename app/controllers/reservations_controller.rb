class ReservationsController < ApplicationController

  def index
    find_profile_customer

    @my_reservations_current = Reservation.where('start_date >= ? AND profile_id = ?' , DateTime.now,  Profile.find_by(user_id: current_user.id).id )

    @my_reservations_past = Reservation.where('start_date < ? AND profile_id = ?' , DateTime.now,  Profile.find_by(user_id: current_user.id).id )
  end

  def new
    @reservation = Reservation.new
  end

  def create
    find_post
    @reservation = Reservation.new(reservation_params)
    if @post
      @reservation.post = @post
      end_hour = @post.quick_assessment[0].nil? ? 1 : @post.quick_assessment[0].to_i
      if !@reservation.start_date.nil?
        @reservation.end_date = (@reservation.start_date + end_hour.hour).to_datetime
        @reservation.start_date = @reservation.start_date.to_datetime #validator only works with datetime and not with TimeToZone
      else
        redirect_to profiles_path
      end
      if @reservation.save!
        session[:post_id] = nil
        session[:flow_basic] = 'terminated'
        redirect_to posts_path
      else
        render :new
      end
    else
      render :profiles_path
    end
  end

  def show
    find_reservation
    @buttons_show = true
    @post =  @reservation.post
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
    @profile_customer = Profile.find(@post.profile_id)
    @price_point = @post.quick_assessment.nil? ? 1 : @post.quick_assessment[0].to_i

  end

  def edit
  end

  def update
    find_reservation
    @status = params[:status]
      if @status == 'acceptada'
        #byebug
        @reservation.acceptada!
        @reservation.save!
        redirect_to reservation_path(@reservation)
        #@reservations_not = @reservation.game.reservations.not_acceptada
        #@reservations_not.each { |resa| resa.rechazada! }
      elsif @status == 'rechazada'
        @reservation.rechazada!
        @reservation.save!
        redirect_to reservation_path(@reservation)
        redirect_to reservation_paths
      else
        @reservation.save
        redirect_to reservation_path(@reservation)
       end
  end

  def destroy

  end

  private

  def find_post
     session[:post_id].nil? ? nil : @post = Post.find(session[:post_id])
  end

  def reservation_params
    params.require(:reservation).permit(:post_id, :profile_id, :start_date, :status)
  end

  def find_profile_worker(post)
    @profile_worker = post.reservations.first.profile.nil? ? nil : post.reservations.first.profile
  end


  def find_profile_customer
    if Profile.find_by(user_id: current_user)
      @profile_customer = Profile.find_by(user_id: current_user)
    else
      # Create a Profile_id for the user (type customer)
      @profile_customer = Profile.new(user_id: current_user.id)
      @profile_customer.save
    end
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
