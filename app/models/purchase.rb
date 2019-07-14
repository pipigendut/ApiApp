# == Schema Information
#
# Table name: purchases
#
#  id            :bigint           not null, primary key
#  user_id       :integer
#  product_id    :integer
#  quantity      :integer
#  purchase_date :datetime
#  info          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :purchase_histories
  has_many :histories, through: :purchase_histories
end
