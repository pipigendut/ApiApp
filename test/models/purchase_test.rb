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

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
