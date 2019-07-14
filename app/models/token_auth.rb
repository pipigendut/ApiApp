# == Schema Information
#
# Table name: token_auths
#
#  id                   :bigint           not null, primary key
#  user_id              :integer
#  authentication_token :string
#  expired              :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class TokenAuth < ApplicationRecord
end
