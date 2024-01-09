class CoordinatesFacade
  def initialize(params)
    @address = params[:address]
  end

  def coordinates
    response = GeocodingService.new.geocode_address(@address)
    serialize_coordinates(response)
  end

  private

  def serialize_coordinates(response)
    results = response[:results]
    
    if !results.empty?
      {
        lat: results.first[:lat],
        lon: results.first[:lon]
      }
    else
      { error: "Coordinates not found" }
    end
  end
end