require "faraday"

class MovieGateway
    def self.conn
      Faraday.new(url: "https://api.themoviedb.org")
    end
  
    def self.get_top_rated_movies
      response = conn.get("/3/movie/top_rated") do |req|
        req.params = {
          api_key: Rails.application.credentials.tmdb[:api_key],
          page: 1
        }
      end
      JSON.parse(response.body)['results']
    end
end



