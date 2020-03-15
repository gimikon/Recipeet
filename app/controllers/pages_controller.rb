class PagesController < ApplicationController
  def signup
    @user = User.new
    
  end
end
