class AdminsController < ApplicationController
  skip_before_action :ensure_clerk_signin

  def index
  end
end
