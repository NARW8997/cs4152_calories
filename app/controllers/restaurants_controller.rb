require "uri"
require "net/http"
require 'json'

class RestaurantsController < ApplicationController
    def index
      @restaurants = Restaurant.all
      # request.remote_ip
      # res = Geocoder.search(request.remote_ip)
      # puts res
      # url = URI("https://api.tomtom.com/search/2/categorySearch/salad%20.json?limit=10&lat=40.799919&lon=-73.968307&categorySet=7315&view=Unified&relatedPois=all&key=2SQNVrdpMvGUKafNUNqXNcV5L2OFpz0K")
      # https = Net::HTTP.new(url.host, url.port)
      # https.use_ssl = true
      # request = Net::HTTP::Get.new(url)
      # response = https.request(request)
      # @responseb = response.read_body
      # @responseb = JSON.parse(@responseb)['results']
      # puts response.read_body
      # puts JSON.parse(@responseb)
    end
end
