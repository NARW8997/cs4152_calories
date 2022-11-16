class RestaurantsController < ActionController::Base
  def index
    @restaurants = Restaurant.all
  end
end
