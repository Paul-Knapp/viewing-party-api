class MovieSerializer
  include JSONAPI::Serializer
  attributes :type, :title, :vote_average
end
