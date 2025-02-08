require 'faraday'
require 'json'
class MovieGateway

    BASE_URL = 'https://api.themoviedb.org/3'

    def self.get_top_rated_movies
        response = connection.get("/movie/popular") do |req|
          req.params = {
            api_key: Rails.application.credentials.tmdb[:api_key],
            page: 1
          }
        end
        if response.status == 200 
            JSON.parse(response.body)['results']
        else
            []
        end
       
    end


    def self.search_movies(query)
        response = connection.get("/search/movie") do |req|
          req.params = {
            api_key: Rails.application.credentials.tmdb[:api_key],
            query: query,
            page: 1
          }
        end
        JSON.parse(response.body)['results']
    end
      private


    def self.connection 
        Faraday.new(url: BASE_URL) do |faraday|
            faraday.adapter Faraday.default_adapter
        end
    end
end
