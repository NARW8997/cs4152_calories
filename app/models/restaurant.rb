class Restaurant < ActiveRecord::Base
  def restaurant
    @restaurants = Restaurant.all
  end

end