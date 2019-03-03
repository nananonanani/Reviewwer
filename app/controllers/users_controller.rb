class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    @user.save
    #render "index"
    session[:user_id] = @user.id
    return redirect_to user_reviews_path(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  private
    def user_params
      params.require(:user).permit(:login_id, :name, :password, :password_confirmation)
    end
end
