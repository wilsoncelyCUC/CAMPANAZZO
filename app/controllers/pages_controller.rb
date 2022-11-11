class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    home_params
   # @professions = Profession.all.limit(4)
    top_profesions
    @profiles = Profile.all.order("score DESC")
    @profiles_top= (Profile.where(score: 4..5 )).limit(5).order("score DESC")
    session[:profile_worker] = nil


  end

# to remove after components developpement
  def components

  end

private

  def home_params
    params.permit!
  end

  def top_profesions
    @profession_top = Hash.new
    counter = 0

    Profession.all.each do |profession|
      if profession.profiles.count > 0 && counter != 12
        @profession_top[profession] = profession.profiles.count
        counter += 1
      end
    end

    @profession_top = @profession_top.sort_by{ |k, v| v }.reverse.to_h
  end

end
