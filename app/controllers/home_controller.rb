class HomeController < ApplicationController
  skip_before_action :ensure_signin
  skip_before_action :ensure_clerk_signin
  skip_before_action :ensure_admin_signin

  def index
    if current_user
      if current_user.account_type == "clerk"
        redirect_to clerks_path
      elsif current_user.account_type == "admin"
        redirect_to admins_path
      else
        redirect_to items_path
      end
    else
      render "index"
    end
  end
end
