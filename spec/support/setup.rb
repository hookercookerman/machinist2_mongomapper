class Address
  include MongoMapper::EmbeddedDocument

  key :street, String
  key :zip, String
  key :country, String
end

class User
  include MongoMapper::Document

  key :username, String
  key :password, String
  key :admin, Boolean, :default => false
  key :address, Address
  
  validates_presence_of :username
  validates_uniqueness_of :username
end

class Post
  include MongoMapper::Document

  key :title, String
  key :body, String
  key :author_id, ObjectId
  key :published, Boolean, :default => true
  
  belongs_to :author, :class_name => "User"
  many :comments
end

class Comment
  include MongoMapper::Document

  key :body, String
  key :post_id, ObjectId
  key :author_id, String

  belongs_to :post
  belongs_to :author, :class_name => "User"
end