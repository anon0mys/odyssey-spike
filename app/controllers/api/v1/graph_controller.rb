class Api::V1::GraphController < ApiController
  include Storyable
  before_action :get_story

  def show
    render json: @story, serializer: StoryGraphSerializer
  end
end
