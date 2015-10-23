class StaticController < ApplicationController
  def index
    @images = Image.all
  end

end
