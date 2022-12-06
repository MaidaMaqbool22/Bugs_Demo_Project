class ProjectsController < ApplicationController
	before_action :set_project, only: %i[ show edit update destroy]

  access  Developer: {except: [:index, :destroy, :new, :create, :assignment, :edit]}, 
  QA: {except: [:show, :index, :destroy, :new, :create, :edit, :update, :assignment]},
  admin: :all
	def index
		@projects = Project.all
    @users = User.where(roles: "Developer")
	end

	def new
		@projects= Project.new
	end

	def show
	end

  def assignment
    @complete_projects = Project.where(stages: "Completed")
  end

	def create
     @project = Project.new(project_params)
     @projects =  @project
     respond_to do |format|
       if @project.save
         format.html { redirect_to projects_path, notice: "Your project is created"}
       else
         format.html { redirect_to new_project_path(@project), notice: "#{@project.errors.full_messages.to_sentence}" }
       end
     end
    end

    def edit
    end

    def update
    respond_to do |format|
      if @projects.update(project_params)s
        if params["project"]["user_id"]
        @projects.user_projects.destroy_all
        @projects.user_projects.create!(user_id: params["project"]["user_id"])
        end
        format.html { redirect_to projects_path, notice: "Project was successfully updated." }
      else
        # format.html { render :edit, status: :unprocessable_entity }
        if request.referrer.include?('assign_projects')
          format.html { redirect_to assign_projects_path, notice: "#{@projects.errors.full_messages.to_sentence}" }
        else
          format.html { redirect_to edit_project_path(@projects), notice: "#{@projects.errors.full_messages.to_sentence}" }
        end
      end
    end
  end
  def destroy
    @projects.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
    end
  end
   private
   def set_project
      @projects = Project.find(params[:id])
    end
   def project_params
   	 params.require(:project).permit(:title, :stages ,:user_id)
   end
end
