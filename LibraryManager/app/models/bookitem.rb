class Bookitem < ActiveRecord::Base
  has_one :user
  belongs_to :book
end

# rails g model Bookitem isbn:string availability:string user:references book:references