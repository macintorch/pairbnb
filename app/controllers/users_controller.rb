class UsersController < ApplicationController
	
	def index
		@user = current_user
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
      params.require(:user).permit(:first_name, :email)
    end
end