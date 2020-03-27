class Story < ApplicationRecord
  include Filterable

  validates_presence_of :name, :description
  belongs_to :user
  has_many :plot_points, dependent: :destroy
  has_many :plot_paths, dependent: :destroy

  scope :filter_by_user, -> (user) { where user: user }
  scope :filter_by_name, -> (search) { where 'stories.name ILIKE ?', "%#{search}%" }
  scope :filter_by_within, -> (latitude, longitude, radius = 1) {
    left_joins(:plot_points).where(%{
     ST_Distance(plot_points.point_lonlat, 'POINT(%f %f)') < %d
    } % [longitude, latitude, radius * 1609.34]).distinct
  }
end
