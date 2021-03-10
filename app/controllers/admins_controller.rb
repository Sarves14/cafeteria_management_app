class AdminsController < ApplicationController
  skip_before_action :ensure_clerk_signin

  def index
  end

  def viewrecords
    if !params[:from] && !params[:to] && !params[:user]
      @from = Order.first.ordered_time
      @to = Date.today + 1
      @user = "all"
    else
      @from = params[:from]
      @to = params[:to]
      @user = params[:user]
    end
    render "viewrecords"
  end

  def manageusers
    render "manageusers"
  end

  def createadmin
    render "createadmin"
  end

  def createclerk
    render "createclerk"
  end

  def createadminuser
    if User.exists?(email: params[:email])
      flash[:error] = "User with this EmailID already exists"
      redirect_to create_admin_path
    else
      user = User.new(first_name: params[:first_name],
                      last_name: params[:last_name],
                      account_type: "admin",
                      email: params[:email],
                      password: params[:password])
      if user.save
        redirect_to manage_users_path
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to create_admin_path
      end
    end
  end

  def createclerkuser
    if User.exists?(email: params[:email])
      flash[:error] = "User with this EmailID already exists"
      redirect_to create_clerk_path
    else
      user = User.new(first_name: params[:first_name],
                      last_name: params[:last_name],
                      account_type: "clerk",
                      email: params[:email],
                      password: params[:password])
      if user.save
        redirect_to manage_users_path
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to create_clerk_path
      end
    end
  end

  def change_filters
    @from = params[:from]
    @to = params[:to]
    @user = params[:user]
    redirect_to view_records_path
  end
end
