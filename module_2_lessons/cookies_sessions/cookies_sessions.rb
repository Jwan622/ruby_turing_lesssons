class ApplicationController < ActionController::Base
  def set_counter
    if cookies[:counter]
      cookies[:counter] = cookies[:counter].to_i
end



#editthiscookie, download that gem
