class ApplicationController < ActionController::Base
  before_action :ensure_signin
  before_action :ensure_clerk_signin
  before_action :ensure_admin_signin

  def ensure_signin
    unless current_user
      redirect_to "/"
    end
  end

  def ensure_clerk_signin
    unless current_user && current_user.account_type == "clerk"
      redirect_to "/"
    end
  end

  def ensure_admin_signin
    unless current_user && current_user.account_type == "admin"
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
