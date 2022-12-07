class PagesController < ApplicationController

  access all: [:home], QA: {except: [:assign_projects, :completed_pro]}, admin: {except: [:assign_projects, :completed_pro]}, Developer: :all
  def home
    @users= User.all
  end
  def assign_projects
    @projects = current_user.projects
  end

  def show
    @projects = Project.find(params[:id])
  end

  def completed_pro
    @projects = current_user.projects
  end
end
