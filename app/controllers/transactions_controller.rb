class TransactionsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :check_cart!
  def new
  	@booking = Booking.find(params[:id])
    @listing = Listing.find(params[:listing_id])
  gon.client_token = generate_client_token

end

private
def generate_client_token
  Braintree::ClientToken.generate
end
end
