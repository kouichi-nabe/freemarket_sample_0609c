class UsersController < ApplicationController
  def new
    render layout: 'application-off.haml'
  end

  def show
    @user = User.find(current_user.id)
  end

  def index
  end
end
