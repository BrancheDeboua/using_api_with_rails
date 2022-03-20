require 'net/http'
require 'json'

class HomeController < ApplicationController
  def index
    url = "http://www.omdbapi.com/?apikey=#{ENV.fetch('OMDBKEY')}&t=blade"
    uri = URI(url)
    res = Net::HTTP.get(uri)
    @response = JSON.parse(res)
    p "================================================================"
    p @response['Error'] == 'Movie not found!'
    p "================================================================"
  end
end
