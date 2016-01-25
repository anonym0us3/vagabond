class User < ActiveRecord::Base
	has_secure_password
  has_many :posts

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/default.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, :current_city, :password, 
  	presence: true,
  	length: { maximum: 50 }


	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end
