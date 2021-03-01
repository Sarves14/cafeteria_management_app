class ItemsController < ApplicationController
  skip_before_action :ensure_clerk_signin
  skip_before_action :ensure_admin_signin

  def index
    render "items"
  end
end
