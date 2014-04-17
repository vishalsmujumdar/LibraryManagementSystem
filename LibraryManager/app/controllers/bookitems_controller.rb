class BookitemsController < ApplicationController
  def new
  	@book = Book.find(params[:book_id])
  	@bookitem = Bookitem.new
  end

  def create
  end
end
