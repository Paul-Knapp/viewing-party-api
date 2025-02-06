require 'faraday'

class MovieGateway

    BASE_URL = 'https://api.themovietb.org/3'

    def self.get_top_rated_movies
        response = connection.get("/movie/top_rated") do |req|
          req.params = {
            api_key: Rails.application.credentials.tmdb[:api_key],
            page: 1
          }
        end
        JSON.parse(response.body)['results']
    end



      private


    def self.connection 
        faraday.new(url: BASE_URL) do |faraday|
            faraday.adapter Faraday.default_adapter
        end
    end
end
