class HomeController < ApplicationController
  def index
  	@listings = Listing.all
  	  #to paginate page
    #Listing.paginate(:page => params[:page], :per_page => 3)
  end
end
