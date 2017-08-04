class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
         attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_many :comments, dependent: :destroy, foreign_key: 'commenter_id'
  has_many :blogs, dependent: :destroy, foreign_key: 'blogger_id'

  def full_name
    self.first_name + " " + self.last_name
  end

  # validates :user_name,
  # :presence => true,
  # :uniqueness => {
  #   :case_sensitive => false
  # } # etc.


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
        # binding.pry
      if auth["provider"] == "facebook"
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.first_name = auth["info"]["name"].split(" ")[0]
        user.last_name = auth["info"]["name"].split(" ")[1]
        user.email = auth["info"]["email"]
        user.password = "123456"
        # user.user_name = auth["info"]["nickname"]
      end
    end
  end
end
