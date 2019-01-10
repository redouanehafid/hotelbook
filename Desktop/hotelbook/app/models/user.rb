class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  
  has_attached_file :logo, styles: { medium: "400x400#", small: "140x140#" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

end
