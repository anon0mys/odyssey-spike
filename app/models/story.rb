class Story < ApplicationRecord
  include Filterable

  validates_presence_of :name, :description
  belongs_to :user
  has_many :plot_points, dependent: :destroy
  has_many :plot_paths, dependent: :destroy

  scope :filter_by_user, -> (user) { where user: user }
end
