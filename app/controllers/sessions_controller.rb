# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.update_or_create(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to :posts, notice: "Welcome #{@user.first_name}!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successful logout'
  end
end
