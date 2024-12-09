module Api
    module V1
      class MoviesController < ApplicationController
        def top_rated
          movies = MovieGateway.get_top_rated_movies
          render json: MovieSerializer(movies)
        end
      end
    end
  end