class BugsController < ApplicationController
  before_action :set_bug, only: %i[ show edit update destroy]
  def index
    @bugs = Bug.all
  end
  def new
    @bugs = Bug.new
    @projects = Project.all
  end

  def show
  end
  
  def create
     @bug = Bug.new(bug_params)
     
     respond_to do |format|
       if @bug.save
         format.html { redirect_to bugs_path, notice: "Your project is created"}
       else
         format.html { render :new, status: :unprocessable_entity }
       end
     end
    end

    def edit
      @projects = Project.all
    end

    def update
    respond_to do |format|
      if @bugs.update(bug_params)
        format.html { redirect_to bugs_path, notice: "Bug was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bugs.destroy
    respond_to do |format|
      format.html { redirect_to bugs_url, notice: "Bug was successfully destroyed." }
    end
  end

  private

    def set_bug
      @bugs = Bug.find(params[:id])
    end

     def bug_params
       params.require(:bug).permit(:title, :stages, :bug_type, :status, :project_id)
     end
end
