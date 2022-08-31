class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @professions = Profession.all.limit(4)
    @profiles = Profile.all.order("score DESC")
    @profiles_top= (Profile.where(score: 4..5 )).limit(5).order("score DESC")
  end

# to remove after components developpement
  def components

  end
end
