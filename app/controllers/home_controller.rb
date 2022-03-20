require 'net/http'
require 'json'

class HomeController < ApplicationController
  def index
    @response = "false"
    if params['commit'] == 'Search'
      url = "http://www.omdbapi.com/?apikey=#{ENV.fetch('OMDBKEY')}&t=#{params['query']}"
      uri = URI(url)
      res = Net::HTTP.get(uri)
      @response = JSON.parse(res)
    end
  end
end
