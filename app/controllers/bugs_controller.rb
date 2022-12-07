class BugsController < ApplicationController
  before_action :set_bug, only: %i[ show edit update destroy]

  access Developer: {except: [:index , :destroy, :new, :create, :edit, :show]}, QA: :all, admin: :all
  def index
    @bugs = Bug.all
  end
  def new
    @bugs = Bug.new
    @bugs.discriptions.build
    @projects = Project.all
  end

  def show
  end
  
  def create
     @bug = Bug.new(bug_params)
     @bugs = @bug
     respond_to do |format|
       if @bug.save
         format.html { redirect_to bugs_path, notice: "Your project is created"}
       else
         format.html { redirect_to new_bug_path(@bug), notice: "#{@bug.errors.full_messages.to_sentence}" }
       end
     end
    end

    def edit
      @projects = Project.all
    end

    def update
    respond_to do |format|
      @bugs.discriptions.destroy_all
      if @bugs.update(bug_params)
        format.html { redirect_to bugs_path, notice: "Bug was successfully updated." }
      else
        # format.html { render :edit, status: :unprocessable_entity }
        format.html { redirect_to edit_bug_path(@bugs), notice: "#{@bugs.errors.full_messages.to_sentence}" }
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
       params.require(:bug).permit(:title, :stages, :bug_type, :status, :project_id, discriptions_attributes: [:detail])
     end
end
