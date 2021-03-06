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
    @booking = Booking.find(params[:id])
    @listing = Listing.find(params[:listing_id])
  end

  def create
    #@booking = current_user.bookings.new(reservation_params)

    @listing = Listing.find(params[:listing_id])

    @booking = @listing.bookings.new(booking_params) #storing listing_id into
    @booking.user_id = current_user.id #booking made by current user

    respond_to do |format|

      if @listing.bookings.all.empty?
          @listing.bookings.all.each do |other|
          if @booking.overlaps?(other)
            redirect_to listing_bookings_path, notice: 'Booking was successfully created.'
          end
        end
      end

      if @booking.save
        format.html do
         ReservationMailer.booking_email(current_user.email, @listing.user.email, @booking_id).deliver_now
         redirect_to listing_bookings_path, notice: 'Booking was successfully created.'
        end
        format.json { render :show, status: :created, location: @listing }

      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
      # byebug
      # ReservationMailer.booking_email(current_user.email, @listing.user.email, @booking_id).deliver_now #from email guide
   # end
    end
  end

# PATCH/PUT /listings/1
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to listing_bookings_path, notice: 'Booking was successfully updated.' }
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
      format.html { redirect_to user_bookings_path, notice: 'Your booking was successfully deleted.' }
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
      params.require(:booking).permit(:check_in, :check_out, :user_id)
    end

    def listing_params
      params.permit(:listing_id)
    end

end