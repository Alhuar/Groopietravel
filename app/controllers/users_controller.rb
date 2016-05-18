class UsersController < ApplicationController
	before_action :authenticate_user!, only: :show

	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end

private

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_controller)
    end

end
