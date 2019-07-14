class Api::V1::ProductsController < Api::V1::ApplicationController
  before_action :authorize_request

  # GET /products
  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def search
    products = Product.where(buildParams)
    render json: products, status: :ok
  end

  private

  def buildParams
    attrs = []
    attrs.push("name_product ILIKE '%#{params[:name_product]}%'") if params[:name_product]
    attrs.push("type_product ILIKE '%#{params[:type_product]}%'") if params[:type_product]
    attrs.push("price = #{params[:price]} ") if params[:price]
    attrs.join(' AND ')
  end
end
