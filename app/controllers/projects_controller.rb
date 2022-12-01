class ProjectsController < ApplicationController
	before_action :set_project, only: %i[ show edit update destroy]
	def index
		@projects = Project.all
    @users = User.all
	end
	def new
		@projects= Project.new
    @users = User.all
	end

	def show
	end
	
  def assignment
    @projects = Project.all
  end

	def create
     @project = Project.new(project_params)

     respond_to do |format|
       if @project.save
         format.html { redirect_to projects_path, notice: "Your project is created"}
       else
         format.html { render :new, status: :unprocessable_entity }
       end
     end
    end

    def edit
      @users = User.all
    end

    def update
    respond_to do |format|
      if @projects.update(project_params)
        format.html { redirect_to projects_path, notice: "Project was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
   	 params.require(:project).permit(:title, :stages, :user_id)
   end
end
