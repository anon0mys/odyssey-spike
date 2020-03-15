class Api::V1::PlotPointsController < ApiController
  include Storyable
  before_action :get_story

  def index
    render json: @story.plot_points
  end

  def show
    render json: @story.plot_points.find(params[:id])
  end

  def create
    point = @story.plot_points.create!(plot_point_params)
    render json: point, status: :created
  end

  def update
    point = @story.plot_points.find(params[:id])
    point.update(plot_point_params)
    render json: point
  end

  def destroy
    @story.plot_points.find(params[:id]).destroy
    head :no_content, status: :accepted
  end

  private

  def plot_point_params
    params.require(:plot_point).permit(
      :name,
      :description,
      :visibility_radius,
      :latitude,
      :longitude
    )
  end
end
