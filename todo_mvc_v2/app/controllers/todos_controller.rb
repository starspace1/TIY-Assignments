class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @all_todos_count = Todo.count
    @flag = 'all'
  end

  def show
    @todos = Todo.all
    @all_todos_count = Todo.count
    render :index
  end

  def completed
    @todos = Todo.where is_complete: true
    @all_todos_count = Todo.count
    @flag = 'completed'
    render :index
  end

  def active
    @todos = Todo.where is_complete: false
    @all_todos_count = Todo.count
    @flag = 'active'
    render :index
  end

  def create

    # render text: "#{params.inspect}"
    #Get rid of whitespace
    params[:todo][:title].strip!
    
    #Only create a new todo if the title isn't empty
    if params[:todo][:title].length > 0
      @new_todo = Todo.create(params.require(:todo).permit(:title))
    end
    
    #Go back to the main page
    redirect_to root_url
  
  end

  def edit
    @todos = Todo.all
    @editing_id = params[:id].to_i
    render :index
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to root_url
  end

  def toggle
    Todo.find(params[:id]).toggle!(:is_complete)
    redirect_to root_url
  end

  def update
    
    #Does params[:todo][:title] exist, if yes, update the title, if no, toggle is_completed

    #Get rid of whitespace
    params[:todo][:title].strip!
    
    #####Move to model code######
    #Update with the new title as long as it's not empty
    if params[:todo][:title].length > 0
      Todo.find(params[:id]).update(params.require(:todo).permit(:title))
    #If it's empty, delete the todo
    else
      Todo.find(params[:id]).destroy
    end
    #############################
    
    #Reset the editing ID instance variable
    @editing_id = -1
    
    #Go back to the main page
    redirect_to root_url
  
  end

  def toggle_all_complete
    @todos = Todo.all
    Todo.update_all is_complete: Todo.more_to_do?
    redirect_to '/todos/index'
  end

  def destroy_all_complete
    Todo.where(is_complete: true).delete_all
    redirect_to '/todos/index'
  end
end
