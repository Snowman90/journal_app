# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    return unless user_signed_in?

    @name = current_user.first_name
  end
end
