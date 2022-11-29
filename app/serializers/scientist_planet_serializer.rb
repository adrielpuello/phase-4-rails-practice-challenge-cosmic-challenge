class ScientistPlanetSerializer < ScientistSerializer
  # notice that this serializer is inheriting the Scientist serializer, so we
  # don't have to repeat the formatting, instead we can simply display the planets
  # assigned to that scientist.
  has_many :planets
end
