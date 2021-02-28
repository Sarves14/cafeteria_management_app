class UsersController < ApplicationController
  skip_before_action :ensure_signin
  skip_before_action :ensure_clerk_signin

  def index
    render "signup"
  end

  def create
    if User.exists?(email: params[:email])
      flash[:error] = "User with this EmailID already exists"
      redirect_to users_path
    else
      user = User.create!(first_name: params[:first_name],
                          last_name: params[:last_name],
                          account_type: "customer",
                          email: params[:email],
                          password: params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    end
  end
end
