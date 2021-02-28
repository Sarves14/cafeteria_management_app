class ItemsController < ApplicationController
  skip_before_action :ensure_clerk_signin
  def index
    render "items"
  end
end
