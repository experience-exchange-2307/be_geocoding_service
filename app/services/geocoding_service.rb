class GeocodingService
  def conn
    api_key = Rails.application.credentials.geoapify[:api_key]
    Rails.logger.info("API Key: #{api_key.inspect}")

    Faraday.new(
      url: "https://api.geoapify.com",
      params: { apiKey: api_key }
    )
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def geocode_address(address)
    safe_address = CGI.escape(address)
    get_url("/v1/geocode/search?text=#{safe_address}&format=json")
  end
end