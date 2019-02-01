module UsersHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def authenticate_user!
    if current_user.nil?
      flash[:denger] = "ログインしてください"
      redirect_to sign_in_path
    end
	end

  def authenticate_admin!
    if session[:user_id] == nil
      flash[:denger] = "ログインしてください"
      redirect_to sign_in_path
    else
      user = User.find(current_user.id)
      if user.admin == false
        flash[:danger] = "ページが存在しません"
        redirect_to root_url
      end
    end
  end

  def current_user_nil?
    unless current_user.nil?
      flash[:denger] = "ログイン済みです"
      redirect_to root_url
    end
  end

end
