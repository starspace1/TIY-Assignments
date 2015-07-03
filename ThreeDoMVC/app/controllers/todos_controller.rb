class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    #Get rid of whitespace
    params[:todo][:title].strip!   
    #Only create a new todo if the title isn't empty
    if params[:todo][:title].length > 0
      @todo = Todo.create(params.require(:todo).permit(:title))
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.toggle!(:is_complete)
  end

  def destroy_all_complete
    complete_todos = Todo.where(is_complete: true)
    @delete_ids = complete_todos.map{|todo| todo.id}
    complete_todos.destroy_all
  end
end
