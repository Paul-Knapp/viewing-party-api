require "faraday"

def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
end

def self.get_top_rated_movies
    response = conn.get("/3/discover/movie?include_adult%3Dfalse%26include_video%3Dfalse%26language%3Den-US%26page%3D1%26sort_by%3Dvote_average.desc%26without_genres%3D99,10755%26vote_count.gte%3D200", {query: artist, client_id: Rails.application.credentials.tmdb.key})
end
