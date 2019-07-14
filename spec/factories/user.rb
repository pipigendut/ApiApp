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

FactoryBot.define do
  factory :user do
    email { 'joe@gmail.com' }
    username { 'joe' }
    full_name { 'joer no' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
