class StoryGraphSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :plot_points
  has_many :plot_paths
end
