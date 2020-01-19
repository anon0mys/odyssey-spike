class Story < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :user
  has_many :plot_points, dependent: :destroy

  def initial_plot_points
    plot_points.where(initial: true)
  end
end
