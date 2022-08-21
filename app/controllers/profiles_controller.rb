class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end


  private

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
