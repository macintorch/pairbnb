class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, booking_id)
		#@url = /users/:id/bookings/:id
		@host = host
		@customer = customer
		mail(to: @host, subject: "You have received a booking from #{@customer}")
	end
end
