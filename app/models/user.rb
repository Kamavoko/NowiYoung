class User < ActiveRecord::Base

  has_many :comments
  has_many :photos
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
    #     :confirmable,
        :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]

  def has_role?(name)
    self.roles.where(name: name).length > 0
  end
  #      attr_accessible :name, :role
  # providerがある場合（Twitter経由で認証した）は、
  # passwordは要求しないようにする。
  def password_required?
   super && provider.blank?
  end
  def self.from_omniauth(auth)
     where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
       user.provider = auth['provider']
       user.uid = auth['uid']
       user.username = auth['info']['nickname']
     end
 end

 def self.new_with_session(params, session)
   if session['devise.user_attributes']
     new(session['devise.user_attributes'], without_protection: true) do |user|
       user.attributes = params
       user.valid?
     end
   else
     super
   end
  end
end
