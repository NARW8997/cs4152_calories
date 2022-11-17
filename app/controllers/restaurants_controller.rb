class RestaurantsController < ActionController::Base
  layout 'application'
  def index
    @restaurants = Restaurant.all
  end
end
