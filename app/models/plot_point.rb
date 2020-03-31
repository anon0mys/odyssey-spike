class PlotPoint < ApplicationRecord
  validates_presence_of :name, :description, :visibility_radius, :latitude, :longitude
  belongs_to :story
  before_save :set_point

  private

  def set_point
    self.point_lonlat = "POINT(#{self.longitude} #{self.latitude})"
  end
end
