class AuthorsController < ApplicationController
  
  # GET authors
  # the "index" default website action
  # stores all the author objects in an instance variable called @authors
  def index
    @authors = Author.all.includes(:books)
  end
  
  # GET /authors/new
  def new
    @author = Author.new
    @author.build_address
    @author.books.build
  end
  
  # POST /authors
  # save an show exceptions with bang method
  # if save to database is successful, redirect request to the author index page
  def create
    @author = Author.new(params[:author])
    @author.save!
    redirect_to authors_path, notice: "Author created successfully"
  end
  
  # GET /authors/:id/edit
  # use the find method to search for the relevant object in the database
  def edit
    @author = Author.find(params[:id])
    @author.build_address unless @author.address
    @author.books.build if @author.books.empty?
  end
  
  # PUT /authors/:id
  # update authors
  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
        redirect_to authors_path, notice: "Author aupdated successfully"
      else
        render :edit
      end
    end
  end