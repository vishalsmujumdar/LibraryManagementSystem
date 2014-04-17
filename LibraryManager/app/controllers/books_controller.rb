class BooksController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
	def index
		@books = Book.all
	end
	def create
		@book = Book.new(post_params)

		if @book.save
			redirect_to new_book_bookitem_path(@book), :notice => "Book added successfully. Enter book item details"
		else
			render "new"
		end
	end
	def new
		@book = Book.new
	end
	def edit
		
	end
	def show
		@book = Book.find(params[:id]) 
	end
	def update
		
	end
	def destroy
		
	end

	private
    	def post_params
        	params.require(:book).permit(:isbn, :title, :description, :category, :authors, :cover) #:cover_file_name, :cover_content_type, :cover_file_size, :cover_updated_at)
      	end

end
