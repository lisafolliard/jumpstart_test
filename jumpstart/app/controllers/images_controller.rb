class ImagesController < ApplicationController

  # before_action :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @image = @user.images.new
  end
end
