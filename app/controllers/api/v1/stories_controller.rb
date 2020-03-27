class Api::V1::StoriesController < ApiController
  include Storyable
  before_action :get_story, only: [:edit, :update, :destroy]

  def index
    @stories = Story.filter(filter_params)
    render json: @stories
  end

  def show
    @story = Story.find(params[:id])
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

  def filter_params
    filters = params.slice(:user, :name)
    if params.key?(:lat) and params.key?(:lng)
      filters[:within] = [params[:lat].to_f, params[:lng].to_f, params.fetch(:radius, 1).to_i]
    end
    filters
  end
end
