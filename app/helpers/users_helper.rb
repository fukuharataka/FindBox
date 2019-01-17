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
			flash[:danger] = 'ログインしてください'
			redirect_to sign_in_path
		end
	end

end
