require 'faraday'
require 'json'

API_URL = "http://www.bensbenzes.com/api/v1/cars/active"

module BenLewisGem
  class Car
    def self.find(id)
     response = Faraday.get("#{API_URL}/#{id}")
     attributes = JSON.parse(response.body)
   end
  end
end
