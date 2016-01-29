class UsersController < Clearance::UsersController
	
	def index
		@user = current_user
	end

	def create
    @user = User.new(user_params)
    @user.email_confirmation_token = Clearance::Token.new
    
		respond_to do |format|
	      if @user.save
	      	UserMailer.registration_confirmation(@user).deliver_later
	        format.html { redirect_to root_path, notice: 'Welcome <%=@user.email%> .' }
	        format.json { render :show, status: :ok, location: @user }
	      else
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
    end


	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = current_user

	end

	def update
		@user = current_user
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
	        format.json { render :show, status: :ok, location: @user }
	      else
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end
	

	private
    # Use callbacks to share common setup or constraints between actions.
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end