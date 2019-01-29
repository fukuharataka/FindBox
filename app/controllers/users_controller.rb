class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show, :edit]
  before_action :current_user_nil?, only:[:new, :session_new]
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def session_new
    @user = User.new
  end

  def session_create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.enable == true
        sign_in @user
        flash[:success] = "ログインしました"
        redirect_to edit_user_path(current_user)
      else
        flash.now[:danger] = "すでに退会済みユーザーです"
        render 'session_new'
      end
    else
      flash.now[:danger] = "入力内容の確認をお願いします"
      render 'session_new'
    end
  end

  def session_destroy
    sign_out
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end

  def create
    @user = User.new(user_params)
    user = User.where(id: 1)
    if user[0] == nil
      @user.admin = true
    end
    if @user.save
      sign_in @user
      flash[:success] = "新規登録をしました"
      redirect_to edit_user_path(current_user)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を編集しました"
      redirect_to edit_user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.enable = false
    user.save
    sign_out
    flash[:success] = "退会しました"
    redirect_to root_path
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nickname, :home_house, :admin)
  end
end
