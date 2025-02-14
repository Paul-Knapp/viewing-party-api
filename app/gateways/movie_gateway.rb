require 'faraday'
require 'json'
class MovieGateway

    BASE_URL = 'https://api.themoviedb.org'

    def self.get_top_rated_movies
        response = connection.get("/3/movie/top_rated") do |req|
          req.params = { 
            page: 1,
            language: 'en-US',
            sort_by: 'popularity.desc',
            api_key: Rails.application.credentials.tmdb[:api_key]
          }
        end
 
        puts "Request URL: #{response.env.url}" #should show me url being called
        if response.status == 200 
            JSON.parse(response.body)['results']
        elsif response.status == 404
            raise StandardError, "Resource not found status: #{response.status}"
        else
            raise StandardError, "Unexpected response status: #{response.status}"
        end
       
    end


    def self.search_movies(query)
        response = connection.get("/3/search/movie") do |req|
          req.params = {
            api_key: Rails.application.credentials.tmdb[:api_key],
            query: query,
            page: 1
          }
        end
        puts "Request URL: #{response.env.url}" #should show me url being called this error handling is copied from the get_top_rated_movies method
        if response.status == 200 
            JSON.parse(response.body)['results']
        elsif response.status == 404
            raise StandardError, "Resource not found status: #{response.status}"
        else
            raise StandardError, "Unexpected response status: #{response.status}"
        end
    end


      private


    def self.connection 
        Faraday.new(url: BASE_URL) do |faraday|
            faraday.response :logger #should theoretically log the request
            faraday.adapter Faraday.default_adapter
        end
    end
end
