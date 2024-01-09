class Api::V1::CoordinatesController < ApplicationController
  def index
    address = params[:address]

    facade = CoordinatesFacade.new(address: address)
    coordinates = facade.coordinates

    if coordinates.present?
      render json: coordinates 
    else
      render json: { error: 'Coordinates not found' }, status: :not_found
    end
  end
end
