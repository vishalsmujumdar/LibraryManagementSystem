class Bookitem < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
end

# rails g model Bookitem isbn:string availability:string user:references book:references