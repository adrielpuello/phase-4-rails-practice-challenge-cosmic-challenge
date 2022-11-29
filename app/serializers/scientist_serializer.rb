class ScientistSerializer < ActiveModel::Serializer
  # formats the data for each scientist to only include the
  # attributes we want to see.
  attributes :id, :name, :field_of_study, :avatar
end
