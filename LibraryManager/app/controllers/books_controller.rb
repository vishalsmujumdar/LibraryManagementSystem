class BooksController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index, :ajaxsearchbooks]
	#load_and_authorize_resource 
	$objJSON = ActiveSupport::JSON

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
		@book = Book.find(params[:id]) 
	end
	def show
		@book = Book.find(params[:id]) 
	end
	def update
		@book = Book.find(params[:id]) 

		if @book.update_attributes(post_params)
			redirect_to book_path(@book), :notice => "Book details edited successfully !"
		else
			render "edit"
		end
	end
	def destroy
		
	end

	def ajaxsearchbooks
		@returnhtml = ""

		@value = params[:searchterm].capitalize
		@books = Book.where(["title LIKE ?","#{@value}%"])
		#@booksJSON = $objJSON.encode(@book)
		
		@returnhtml = @books.size == 0 ? "No books match search term" : render_to_string(partial: 'bookforms')
		
		respond_to do |format|
		   format.html { render :html => @returnhtml }
		   format.json { render :json => @booksJSON }
		end
	end

	private
    	def post_params
        	params.require(:book).permit(:isbn, :title, :description, :category, :authors, :cover ) #:cover_file_name, :cover_content_type, :cover_file_size, :cover_updated_at)
      	end

end
