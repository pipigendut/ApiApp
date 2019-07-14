class Api::V1::PurchasesController < Api::V1::ApplicationController
  before_action :authorize_request

  # POST /purchases
  def create
    purchases_attrs = request.params[:purchases_attributes]
    purchases_attrs.each do |p|
      purchase = Purchase.new(p)
      purchase.save
    end
  end
end
