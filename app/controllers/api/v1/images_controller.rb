class Api::V1::ImagesController < ApplicationController
  def show
    image = ImagesFacade.get_image_by_query(params[:location])
    render json: ImageSerializer.image_json(image)
  end
end
