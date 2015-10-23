class ImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @image = @user.images.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to user_path(@image.user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
    @image.destroy
      redirect_to user_path(@user)
  end

  private

  def image_params
    params.require(:image).permit(:image, :description)
  end

end
