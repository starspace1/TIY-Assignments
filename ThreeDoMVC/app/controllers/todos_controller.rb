class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.create(params.require(:todo).permit(:title))
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

  def toggle_all_complete
    @todos = Todo.all
    Todo.update_all is_complete: Todo.more_to_do?
  end
end
