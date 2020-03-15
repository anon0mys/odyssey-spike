class Story < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :user
  has_many :plot_points, dependent: :destroy
  has_many :plot_paths, dependent: :destroy
end
