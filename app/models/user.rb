class User < ApplicationRecord

  has_many :activities , dependent: :destroy
  has_one_attached :avatar
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :registerable, :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable, :omniauthable, :omniauth_providers => [:facebook]
  # verify your schema for the additional fields/columns

  # validates :avatar, presence: true, integrity: true, processing: true

  attr_accessor :remove_avatar

  # :state_event
  # after_save :trigger_state, if: :state_event
  # private def trigger_state
  #   send(state_event) if send(:"can_#{state_event}?")
  # end

  after_save :purge_avatar, if: :remove_avatar
  private def purge_avatar
    avatar.purge_later
  end


def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.image = auth.info.image
  end
end
end
