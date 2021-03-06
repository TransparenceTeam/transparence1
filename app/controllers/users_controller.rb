class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  private
   def user_params
     params.require(:user).permit(:name, :email)
   end
end
