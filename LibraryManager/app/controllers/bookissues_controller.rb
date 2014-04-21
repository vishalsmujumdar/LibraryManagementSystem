class BookissuesController < ApplicationController

	def new
		@book = Book.find(params[:book_id])
		@bookitem = @book.bookitems.find(params[:bookitem_id])
	end

	def create
		# create bookissue object => bookitem_id, user_id
		@bookitem = Bookitem.find(params[:bookitem_id])

		@bookissue = @bookitem.bookissues.new

		@paramuser = params[:user];
  		@user = User.where(["employee_id = ?", @paramuser[:employee_id].to_i]).first

  		@bookissue.user_id = @user[:id]

  		# set dates for issue and return
  		@bookissue.date_of_issue = Date.today
  		@bookissue.date_of_return = @bookissue.date_of_issue + 30
		# update bookitem availability to false
		if @bookissue.save
			@bookitem.update_attributes!(:availability => false)
			redirect_to book_path(@bookitem.book), :notice => "Book issued to #{@user.name}"
		else
			render "new"
		end

	end

end
