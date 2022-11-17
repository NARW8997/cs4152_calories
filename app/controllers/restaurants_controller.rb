class RestaurantsController < ActionController::Base
  def index
    @restaurants = Restaurant.all
  end

  # def restaurant
  #   # redirect_to restaurants_path
  # end
end
