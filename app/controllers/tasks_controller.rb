class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    

    if params[:completed] == "false"
      @tasks = @tasks.where({completed: false })
    end
    ####DELETE THIS LINE to use following methods

    # # #####  Original
    # # if params[:complete]   # if value is anything, which is why it can be improved upon
    # #   @tasks = Task.where(:complete => false)
    # #
    # # #####  Slightly improved
    # # if params[:complete] == "false"   #if value is false
    # #   @tasks = Task.where(:complete => false)
    # #
    # # ######   Best   best because it filters by true or false
    # #               # key
    #
    # if params[:complete]
    #                 # task.where finds a list of tasks where a condition is true (what's inside the () ).   .where is a method on active records
    #   @tasks = Task.where(:complete => params[:complete])
    # else
    #   @tasks = Task.all
    #     respond_to do |format|
    #       format.html
    #       format.csv do
    #         headers['Content-Disposition'] = "attachment; filename=\"task-list\""
    #         headers['Content-Type'] || = 'text/csv'
    #       end
    #     end
    #   end
    #
    #   #### refactored of BEST
    #                   @tasks = Task.all
    #
    #                   if params[:complete]
    #                     @tasks = Task.where(:complete => params[:complete])
    #                   end
    #
    #                   #### example of what you can add into this technique
    #                   if params[:due_date]
    #                     @tasks = Task.where(:complete => params[:due_date])
    #                   end
    #
    #                   @tasks = @tasks.where(some_other_condition: true)
    #
    #                     respond_to do |format|
    #                       format.html
    #                       format.csv do
    #                         headers['Content-Disposition'] = "attachment; filename=\"task-list\""
    #                         headers['Content-Type'] || = 'text/csv'
    #                     end
    #                   end

    end


  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :completed, :due_date)
    end
end
