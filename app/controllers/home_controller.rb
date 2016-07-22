class HomeController < ApplicationController
  def index
  	@listings=Listing.new
  end
end
