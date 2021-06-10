class FavoritesController < ApplicationController
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
    p "◆◆current_user.favorites◆◆"
    @fovo_id = current_user.favorites
    @user = User.find(params[:id])
    @favorites = @user.favorite_blogs
    p "◆◆favorite◆◆"
    p @favorites
  end


end
