class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show

  end

  def edit
  end

  def sign_in
  end

  def session_create
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "新規登録をしました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nickname, :home_house)
  end
end
