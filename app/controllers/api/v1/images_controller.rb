class Api::V1::ImagesController < ApplicationController
  def show
    image = ImagesFacade.get_image_by_query(params[:location])
  end
end
