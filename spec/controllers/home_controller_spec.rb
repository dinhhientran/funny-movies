require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  describe "GET #index" do
    it "returns list of existing movies" do
      user = create(:user)
      movies = create_list(:movie, 3, user: user)
      get :index
      movies.each do |movie|
        expect(response.body).to have_content(movie.title)
      end
    end
  end
end