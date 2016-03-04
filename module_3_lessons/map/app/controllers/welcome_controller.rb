class WelcomeController < ApplicationController
  respond_to :html, :json

  def index
    coordinates = {}
    coordinates[:latitude] = 39.749813
    coordinates[:longitude] = -120.999717
    respond_with coordinates
  end
end
