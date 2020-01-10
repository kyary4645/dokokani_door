class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.get_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    return user
  end

  private

  def self.get_email(auth)
    auth.info.email || "#{auth.uid}-#{auth.provider}@example.com"
  end
end
