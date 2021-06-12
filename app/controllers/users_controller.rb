class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :show]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'アカウントを作成しました'
      redirect_to new_session_path
    else
      render :new
    end
  end

  def show
    @blog = Blog.new
    @user =User.find(params[:id])
    @blogs = @user.blogs.all
  end

  def edit
    @user =User.find(current_user.id)
  end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "プロフィールを編集しました！"
    else
      render :edit
    end
end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation,:comment,:image)
  end

end
