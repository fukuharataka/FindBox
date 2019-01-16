class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show

  end

  def edit
  end

  def session_new
  end

  def session_create
    binding.pry
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.enable == true
        sign_in user
        flash.now[:success] = "ログインしました"
        redirect_to root_url
      else
        flash.now[:danger] = "すでに退会済みユーザーです"
        render 'User_new'
      end
    else
      flash.now[:danger] = "入力内容の確認をお願いします"
      render 'User_new'
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
