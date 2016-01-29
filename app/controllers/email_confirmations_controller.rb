class EmailConfirmationsController < ApplicationController
  def update
    @user = User.find_by!(email_confirmation_token: params[:email_confirmation_token])
    if @user
      @user.confirm_email
      sign_in(@user)
      redirect_to root_path, notice: t("flashes.confirmed_email")
    else
      redirect_to root_path, notice: "Confrimation link WRONG!"
    end
  end
end