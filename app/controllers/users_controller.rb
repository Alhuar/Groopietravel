class UsersController < ApplicationController

	def index
		@users = User.all
	end
	
	def show
		@user = current_user
		@user_bands = @user.bands
		id_array =  UsersBand.where(user_id: current_user.id, is_favorite: true).pluck(:band_id)
		@user_favorite_bands = [] 
		id_array.each do |id|
			@user_favorite_bands << Band.find(id)
		end

		# binding.pry
	end



private

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_controller)
    end

end
