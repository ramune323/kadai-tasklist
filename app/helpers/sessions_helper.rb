module SessionsHelper
  # current_userがnilであれば、現在ログインしているユーザ情報を代入する
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end
  
  # current_userがnilであればfalse、ユーザ情報が入っていればtrue
  def logged_in?
    !!current_user
  end
end
