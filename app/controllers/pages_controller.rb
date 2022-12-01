class PagesController < ApplicationController
  def home
    
  end
  def assgin_projects
    @users = User.all
  end
end
