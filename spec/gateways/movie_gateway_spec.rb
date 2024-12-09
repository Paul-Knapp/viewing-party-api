require 'pry'

RSpec.describe "Movies Endpoints" do 
    describe "Gateway Access" do 
        it "fetches top rated movies" do
            movies = get "/api/v1/movies/top_rated"
        end
    end
end