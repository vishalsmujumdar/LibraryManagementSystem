class Book < ActiveRecord::Base

	has_many :bookitems
	
	has_attached_file :cover, :styles => { :medium => "300x300>", :small => "200x200>", :thumb => "100x100>"}, :default_url => "/assets/book_cover_:style.png"
	#validates_attachment_presence :cover
	validates_attachment_content_type :cover, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	

end


# rails g model Bookitem isbn:string availability:string user:references book:references
#
