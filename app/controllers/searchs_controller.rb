class SearchsController < ApplicationController
  def index
    search_params = params["q"]
    @conn = Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.params["api_key"] = ENV["GIPHY_API_KEY"]
      faraday.params["q"] = search_params
      faraday.params["limit"] = '5'
      faraday.params["offset"] = '0'
      faraday.params["rating"] = 'G'
      faraday.params["lang"] = 'en'
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/v1/gifs/search")
    results = JSON.parse(response.body, symbolize_names: true)[:data]

    @gifs  = results.map do |result|
      Gif.new(result)
    end
  end
end