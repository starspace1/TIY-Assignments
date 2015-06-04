class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @all_todos_count = Todo.count
    @flag = 'all'
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

  def create_todo

    # render text: "#{params.inspect}"
    #Get rid of whitespace
    params[:todo][:title].strip!
    
    #Only create a new todo if the title isn't empty
    if params[:todo][:title].length > 0
      @new_todo = Todo.create(params.require(:todo).permit(:title))
    end
    
    #Go back to the main page
    redirect_to '/todos/index'
  
  end

  def edit
    @todos = Todo.all
    @editing_id = params[:id].to_i
    render :index
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to '/todos/index'
  end

  def toggle_complete
    Todo.find(params[:id]).toggle!(:is_complete)
    redirect_to '/todos/index'
  end

  def update
    
    #Get rid of whitespace
    params[:todo][:title].strip!
    
    #Update with the new title as long as it's not empty
   if params[:todo][:title].length > 0
      Todo.find(params[:id]).update(params.require(:todo).permit(:title))
    #If it's empty, delete the todo
    else
      Todo.find(params[:id]).destroy
    end
    
    #Reset the editing ID instance variable
    @editing_id = -1
    
    #Go back to the main page
    redirect_to '/todos/index'
  
  end
end
