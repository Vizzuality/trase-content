class HomeController < ApplicationController
  def index
    @posts = Post.order(:date => 'DESC').where(:state => 1)
    render json: @posts
  end
end
