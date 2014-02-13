class PeopleController < ApplicationController
  require 'will_paginate/array'

  def index
    @user = User.new
    # @people = Person.all
    @person = Person.new

    # Person search form
    if params[:search]
      # Partial match query
      @people = Person.where(name: /^#{Regexp.escape(params[:search])}/i)
    else
      @people = Person.all.paginate(page: params[:page], per_page: 8)
    end

    respond_to do |format|
      format.html {}
      format.js
      format.json { render json: @people }
    end
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save && @person.update(user_id: current_user.id)
      # Do some ajax stuff to "Add new person" tab?
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def person_params
      params.require(:person).permit(:name, :age, :location, :description, :image)
    end
end
