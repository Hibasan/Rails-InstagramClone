class BlogsController < ApplicationController

  def new
    @blog = Blog.new
    @user =User.find(current_user.id)

  end

  def confirm
    @blog = Blog.new(blog_params)
    p "◆◆@blog_confirm◆◆"
    p @blog
    @user =User.find(current_user.id)

  end

  def create
    @blog = current_user.blogs.build(blog_params)
    p "◆◆@blog_create◆◆"
    p @blog
    @user =User.find(current_user.id)
    if params[:back]
      render :new
    else
      if @blog.save(blog_params)
        ContactMailer.contact_mail(@blog,@user).deliver
        redirect_to user_path(current_user.id),notice:"投稿しました！"
      else
        render :new
      end
    end
  end
  def index
    @blogs = Blog.all
    @blog = Blog.new
    @user =User.find(params[:id])

  end

  def edit
    @blog = Blog.find(params[:id])
    @user =User.find(current_user.id)
  end

  def update
    @blog = Blog.find(params[:id])
    @user =User.find(current_user.id)
    if @blog.update(blog_params)
      redirect_to user_path(current_user.id), notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to user_path(current_user.id), notice:"ブログを削除しました！"
  end

  private
  def blog_params
    params.require(:blog).permit(:content,:image,:image_cache)
  end

end
