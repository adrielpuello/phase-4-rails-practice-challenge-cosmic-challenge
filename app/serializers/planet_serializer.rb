class PlanetSerializer < ActiveModel::Serializer
  # this formats the planet data so when we display it using the
  # show action within the scientists controller we don't include the
  # time stamps.
  attributes :id, :name, :distance_from_earth, :nearest_star, :image
end
