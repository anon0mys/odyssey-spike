require 'rails_helper'

RSpec.describe Story, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  context 'relationships' do
    it { should belong_to :user }
    it { should have_many :plot_points }
    it { should have_many :plot_paths }
  end

   context 'scopes' do
     before(:each) do
       @homer = create(:user)
       @stoker = create(:user)
       @odyssey = create(:story, user: @homer, name: "The Odyssey")
       @illiad = create(:story, user: @homer, name: "The Illiad")
       @dracula = create(:story, user: @stoker, name: "Dracula")
     end

    it 'should filter by user' do
      expect(Story.filter(user: @homer).count).to eq 2

      stoker_stories = Story.filter(user: @stoker)
      expect(stoker_stories.count).to eq 1
      expect(stoker_stories.first).to eq @dracula
    end

    it 'should filter by name' do
      expect(Story.filter(name: "Frakenstein").count).to eq 0
      expect(Story.filter(name: "The Odyssey").first).to eq @odyssey
      expect(Story.filter(name: "Dracula").first).to eq @dracula
    end

    it 'should filter by name fragments' do
      expect(Story.filter(name: "The").count).to eq 2
      expect(Story.filter(name: "d").count).to eq 3
    end

    it 'should filter by location' do
    end
  end
end
