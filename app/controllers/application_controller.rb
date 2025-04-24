class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin?
  
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user.present?
  end
  
  def admin?
    current_user&.admin?
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path, alert: 'Veuillez vous connecter pour accéder à cette page'
    end
  end
  
  def require_admin
    unless admin?
      redirect_to root_path, alert: 'Accès réservé aux administrateurs'
    end
  end
end