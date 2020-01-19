class StoriesController < ApplicationController
  before_action :get_story, only: [:show, :edit, :update]

  def index
    @stories = current_user.stories.all
  end

  def show
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.create!(story_params)
    redirect_to stories_path
  end

  def edit
  end

  def update
    @story.update!(story_params)
    redirect_to stories_path
  end

  def destroy
    current_user.stories.destroy(params[:id])
    redirect_to stories_path
  end

  private

  def story_params
    params.require(:story).permit(:name, :description)
  end

  def get_story
    @story = current_user.stories.find(params[:id])
  end
end
