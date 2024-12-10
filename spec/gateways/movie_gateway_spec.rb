require 'pry'
require 'rails_helper'

RSpec.describe MovieGateway do
  describe '.get_top_rated_movies' do
    let(:mock_response) do
      {
        results: [
          { id: 1, title: 'Test Movie', vote_average: 8.5 },
          { id: 2, title: 'Another Movie', vote_average: 7.0 }
        ]
      }.to_json
    end

    before do
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated")
        .with(query: { api_key: Rails.application.credentials.tmdb[:api_key], page: 1 })
        .to_return(status: 200, body: mock_response, headers: { 'Content-Type' => 'application/json' })
    end

    it 'fetches top rated movies from the API' do
      movies = MovieGateway.get_top_rated_movies

      expect(movies).to be_an(Array)
      expect(movies.size).to eq(2)
      expect(movies.first).to include('id' => 1, 'title' => 'Test Movie', 'vote_average' => 8.5)
      expect(movies.last).to include('id' => 2, 'title' => 'Another Movie', 'vote_average' => 7.0)
    end
  end
end