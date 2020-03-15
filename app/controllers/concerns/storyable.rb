module Storyable
  extend ActiveSupport::Concern

  def get_story
    @story ||= current_api_user.stories.find(params[:story_id])
  end
end
