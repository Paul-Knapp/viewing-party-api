require "faraday"

def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
end

def self.get_top_rated_movies
    response = conn.get("/3/discover/movie?include_adult%3Dfalse%26include_video%3Dfalse%26language%3Den-US%26page%3D1%26sort_by%3Dvote_average.desc%26without_genres%3D99,10755%26vote_count.gte%3D200", {query: artist, client_id: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MGM0NjJkODllYzYxNzFjNWE5MDUxNzAyMDc1MjM2YiIsIm5iZiI6MTczMzM0NDA4NC41NzUsInN1YiI6IjY3NTBiYjU0YjY2NjgzMGI2ZTQzZmM2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zchyLqxOW2b8gVJZPRvhQl_zJNIitkGUv1yVdg_8GMU })
end
