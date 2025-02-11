class Api::V1::MoviesController < ApplicationController
    def top_rated
      movies = MovieGateway.get_top_rated_movies
      render json: MovieSerializer.format_response(movies)
    end


    def search
      query = params[:query] #use params
      if query.nil?
        render json: { error: 'Query parameter is required' }, status: :bad_request
      else
        movies = MovieGateway.search_movies(query)
        render json: format_response(movies)
      end
 
    end


    private


end