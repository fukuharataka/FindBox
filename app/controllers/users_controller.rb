class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show, :edit]
  def new
    @user = User.new
  end

  def show
    @user = find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def session_new
    @user = User.new
  end

  def session_create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.enable == true
        sign_in user
        flash.now[:success] = "ログインしました"
        redirect_to root_url
      else
        flash.now[:danger] = "すでに退会済みユーザーです"
        redirect_to 'new'
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
    if @user.save
      sign_in @user
      flash[:success] = "新規登録をしました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find(current_user.id)
    if @profile.update(user_params)
      flash[:success] = "ユーザー情報を編集しました"
      redirect_to root_url
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nickname, :home_house)
  end
end
