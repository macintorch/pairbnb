require 'carrierwave/orm/activerecord'
class User < ActiveRecord::Base
	has_many :listings, dependent: :destroy
	has_many :bookings, dependent: :destroy
	validates :email, :password, presence: true
	

  include Clearance::User

  def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth['provider']
	    user.uid = auth['uid']
	    if auth['info']
	      user.name = auth['info']['name'] || ""
	      user.email = auth['info']['email'] || ""
	    end
	  end
	end

   def confirm_email
    self.email_confirmed_at = Time.current
    save
  end

end
