class Api::V1::StoriesController < ApiController
  include Storyable
  before_action :get_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = current_api_user.stories.all
    render json: @stories
  end

  def show
    render json: @story
  end

  def create
    @story = Story.create!(user: current_api_user, **story_params)
    render json: @story, status: :created
  end

  def update
    @story.update(story_params)
    render json: @story
  end

  def destroy
    @story.destroy
    head :no_content, status: :accepted
  end

  private

  def story_params
    params.require(:story).permit(:name, :description)
  end
end
