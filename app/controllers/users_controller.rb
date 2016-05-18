class UsersController < ApplicationController

	def index
		@users = User.all
	end
	def show
		@user = current_user
		@user_bands = current_user.bands
		# binding.pry
	end

private

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_controller)
    end

end
