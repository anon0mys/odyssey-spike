require 'rails_helper'

RSpec.describe PlotPath, type: :model do
  context 'relationships' do
    it { should belong_to :story }
    it { should belong_to :to }
    it { should belong_to :from }
  end
end
