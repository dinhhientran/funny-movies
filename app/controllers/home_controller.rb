class HomeController < ApplicationController
  def index
    @movies = Movie.all.order(created_at: :desc)
  end
end
