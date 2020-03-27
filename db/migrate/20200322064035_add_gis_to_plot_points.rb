class AddGisToPlotPoints < ActiveRecord::Migration[6.0]
  def change
    change_table :plot_points do |t|
      t.st_point :point_lonlat, geographic: true
    end
    add_index :plot_points, :point_lonlat, using: :gist
  end
end
