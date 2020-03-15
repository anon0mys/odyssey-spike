class CreatePlotPaths < ActiveRecord::Migration[6.0]
  def change
    create_table :plot_paths do |t|
      t.references :story, foreign_key: true
      t.belongs_to :to, foreign_key: { to_table: :plot_points }
      t.belongs_to :from, foreign_key: { to_table: :plot_points }

      t.timestamps
    end
  end
end
