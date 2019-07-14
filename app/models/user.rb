# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  username               :string           default(""), not null
#  full_name              :string           default(""), not null
#  date_of_birth          :date
#  address                :string
#  phone                  :string
#  gender                 :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  has_one :token_auth
  has_many :purchases
  has_many :histories
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :generate_token

  def generate_token
    loop do
      token = Base64.encode64(SecureRandom.hex)
      unless TokenAuth.exists?({authentication_token: token})
        token_auth = TokenAuth.where(user_id: self.id).first_or_initialize
        token_auth.update_attributes({user_id: self.id, authentication_token: token, expired: 60.minutes.since})
        return token_auth.save
      end
    end
  end
end
