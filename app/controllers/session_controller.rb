class SessionController < Clearance::SessionsController
    def create
        auth = request.env['omniauth.auth']
        user = User.find_or_initialize_by(email: auth.info.email)
        user.password = "string"
        user.save!
        sign_in(user)
        redirect_to '/'
    end

    def new
  		redirect_to '/auth/facebook'
	end

	def destroy
  		reset_session
  		redirect_to root_path, notice => 'Signed out'
	end
end
