class ApiController < ApplicationController
  def posts
    posts = Post.order(:date => 'DESC').where(:state => 1)
    render json: posts
  end

  def site_dive
    render json: SiteDive.find(params[:id])
  end
end
