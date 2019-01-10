class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :category
  belongs_to :user

  def self.search(params)
  	posts = Post.where("titre like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  	posts
  end

end
