class UsersController < ApplicationController

	def index
		@users = User.all
	end
	
	def show
		@user = current_user
		@user_bands = @user.bands
		@band = Band.new
	end

private

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_controller)
    end

end
