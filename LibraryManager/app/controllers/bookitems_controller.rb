class BookitemsController < ApplicationController
  def new
  	@book = Book.find(params[:book_id])
  	@bookitem = Bookitem.new
  end

  def create
  	@book = Book.find(params[:book_id])
    @bookitem = @book.bookitems.create()
  	@paramuser = params[:user];
  	@user = User.where(["employee_id = ?", @paramuser[:employee_id].to_i]).first
  	@bookitem.user_id = @user[:id]

	if @bookitem.save
		@book.number_of_copies += 1
		@book.save
		redirect_to book_path(@book), :notice => "Book item saved successfully"
	else
		render "new"
	end
  end
end
