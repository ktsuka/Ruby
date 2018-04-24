class SessionsController < ApplicationController

  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      flash.notice = "ログインしました (ユーザ名: " + user.name + ")"
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to "/users"
  end

  def destroy
    session.delete(:user_id)
    redirect_to "/users"
  end
end
