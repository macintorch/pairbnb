class UserMailer < ApplicationMailer
	def registration_confirmation(user)
		#@url = /users/:id/bookings/:id
		@user = user
		
		mail(to: @user.email, subject: "Please confirm your email.")
	end
end
