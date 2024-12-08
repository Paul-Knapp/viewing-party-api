module Api
  module V1
    class MoviesController < ApplicationController
      def top_rated
        movies = MovieGateway.get_top_rated_movies
        render json: format_response(movies)
      end

      private 

      def format_response(movies)
        {
          data: movies.first(20).map do |movie|
            {
              id: movie['id'].to_s,
              type: 'movie',
              attributes: {
                title: movie['title'],
                vote_average: movie['vote_average']
              }
            }
          end
        }
      end
    end
  end
end