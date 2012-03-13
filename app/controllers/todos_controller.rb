class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @active = @project.todos.active
      @complete = @project.todos.complete
    else
      @active = Todo.active
      @complete = Todo.complete
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {active: @active, complete: @complete} }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    if params[:project_id]
      @project = Project.find(params[:project_id])
    end
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      project = Project.find(params[:todo][:project_id]) if params[:todo][:project_id]
      success_url = project ? project_todos_url(project) : todos_url
      if @todo.save
        format.html { redirect_to success_url, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to todos_url, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end

  def purge_completed
    Todo.complete.each { |todo| todo.destroy }
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end
end
