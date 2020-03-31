require 'rails_helper'

RSpec.describe PlotPoint, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :visibility_radius }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
  end

  context 'relationships' do
    it { should belong_to :story }
  end

  context 'when saved' do
    it 'should set a point' do
      plot_point = build(:plot_point)
      expect(plot_point.point_lonlat).to be nil
      plot_point.run_callbacks :save
      expect(plot_point.point_lonlat).to be_a(RGeo::Geographic::SphericalPointImpl)
    end

    it 'should update a point when lon lat changes' do
      plot_point = create(:plot_point)
      expect(plot_point.point_lonlat).to be_a(RGeo::Geographic::SphericalPointImpl)
      original_point = plot_point.point_lonlat
      plot_point.longitude = 1.0
      plot_point.latitude = 1.0
      plot_point.save

      expect(plot_point.point_lonlat).not_to eq original_point
    end
  end
end
