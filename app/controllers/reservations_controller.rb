class ReservationsController < ApplicationController
before_action :find_post

  def index
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(post_params)
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
        render :profiles_path
      end
    else
      render :profiles_path
    end
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private

  def find_post
    @post = Post.find(session[:post_id])
  end

  def post_params
    params.require(:reservation).permit(:post_id, :profile_id, :start_date)
  end

end
