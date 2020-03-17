class HomeController < ApplicationController
  def top
  end

  def about
  end

  def signup
    @user = User.new
  end
end
