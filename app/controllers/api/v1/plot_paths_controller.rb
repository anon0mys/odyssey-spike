class Api::V1::PlotPathsController < ApiController
  include Storyable
  before_action :get_story

  def index
    render json: @story.plot_paths
  end

  def show
    render json: @story.plot_paths.find(params[:id])
  end

  def create
    path = @story.plot_paths.create!(plot_path_params)
    render json: path, status: :created
  end

  def update
    path = @story.plot_paths.find(params[:id])
    path.update(plot_path_params)
    render json: path
  end

  def destroy
    @story.plot_paths.find(params[:id]).destroy
    head :no_content, status: :accepted
  end

  private

  def plot_path_params
    path_params = params.require(:plot_path).permit(:to, :from)
    path_params.each do |key, id|
      path_params[key] = @story.plot_points.find(id)
    end
  end
end
