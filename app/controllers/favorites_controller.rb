class FavoritesController < ApplicationController
  skip_before_action :login_required, only: [:show]

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to user_path(current_user.id), notice: "#{favorite.blog.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to user_path(current_user.id), notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
  end

  def show
    @blog = Blog.new
    @user = User.find(params[:id])
    @favorites = @user.favorite_blogs
    @fovo_id = @user.favorites

  end


end
