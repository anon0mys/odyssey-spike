class PlotPoint < ApplicationRecord
  validates_presence_of :name, :description, :visibility_radius, :latitude, :longitude
  belongs_to :creation
end
