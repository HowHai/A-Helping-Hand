class PeopleController < ApplicationController
  def index
    @user = User.new
    @people = Person.all
    @person = Person.new
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save && @person.update(user_id: current_user.id)
      # Do some ajax stuff to "Add new person" tab?
      flash[:success] = "You have helped #{@person.name}"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def person_params
      params.require(:person).permit(:name, :age, :location, :description)
    end
end
