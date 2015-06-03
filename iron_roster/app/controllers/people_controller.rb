class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @people = Person.find(params[:id])
    render :index
  end

  def new_student_form
    @people = Person.all
  end

  def create_student
    Person.create(params.require(:person).permit(:name, :subject, :github_account))
    redirect_to '/people'
  end

  def edit

  end

  def update

  end

  def delete

  end


end
