class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

def index
    @bookings = Booking.where(user_id: current_user.id)
  end
   def show
  end

  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
  end
  
  def edit
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.new(booking_params)

    
    
    respond_to do |format|
      if @booking.save
        format.html { redirect_to listing_bookings_path, notice: 'Booking was successfully created.'}
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

# PATCH/PUT /listings/1
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  

#delete /bookings/1
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:check_in, :check_out)
    end

    def listing_params
      params.permit(:listing_id)
    end

end