class SessionsController < ApplicationController
  def new
  end

  def create
    p "◆◆session_create◆◆"
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      p "◆◆user.id #{user.id}◆◆"
      session[:user_id] = user.id
      p "◆◆session[:user_id] #{session[:user_id]}◆◆"
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

end
