# frozen_string_literal: true
class UserProfileController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end
end
