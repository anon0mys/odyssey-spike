class CreatePlotPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :plot_points do |t|
      t.string :name
      t.string :description
      t.boolean :hidden
      t.float :visibility_radius
      t.decimal :latitude, precision: 15, scale: 12
      t.decimal :longitude, precision: 15, scale: 12
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end
