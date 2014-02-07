class PeopleController < ApplicationController
  def index
    @user = User.new
  end

  def new
    @person = Person.new
  end

  def test

  end
end
