class Api::V1::ProductsController < ApplicationController

  before_action :authenticate_api_v1_user!
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.order(:created_at).page(params[:page])
    render json: @products, meta: pagination_meta(@products)
  end

  def show
    render json: @product
  end

  def create
    @product = current_api_v1_user.products.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @product.destroy
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :user_id)
    end
end
