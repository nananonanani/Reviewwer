class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login_id: params[:login_id])
    if user && user.authenticate(params[:password])
      # ログイン処理
      session[:user_id] = user.id
      #redirect_to controller: 'reviews', action: 'index'
      return redirect_to user_reviews_path(user_id: user.id)
    else
      render "new"
    end
  end

  def destroy
  end
end
