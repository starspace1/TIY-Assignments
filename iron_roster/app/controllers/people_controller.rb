class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @people = Person.where(id: params[:id])
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
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update(params.require(:person).permit(:name, :subject, :github_account))
    redirect_to '/people'
  end

  def delete
    Person.find(params[:id]).destroy
    redirect_to '/people'
  end


end
