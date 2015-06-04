class OtherController < ApplicationController
  
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
