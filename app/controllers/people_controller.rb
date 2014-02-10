class PeopleController < ApplicationController
  def index
    @user = User.new
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def test

  end
end
