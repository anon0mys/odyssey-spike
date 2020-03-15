class PlotPath < ApplicationRecord
  belongs_to :story
  belongs_to :from, class_name: 'PlotPoint'
  belongs_to :to, class_name: 'PlotPoint'
end
