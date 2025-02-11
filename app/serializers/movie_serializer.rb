class MovieSerializer

    def self.format_response(movies) #needs to be a serializer but this is a quick fix
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