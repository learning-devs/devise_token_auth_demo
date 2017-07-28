class Api::V1::ProductsController < ApplicationController

  before_action :authenticate_api_v1_user!
  before_action :set_product, only: [:show, :update, :destroy]

  
  def index
    @products = Product.filter_page(params[:page],params[:size])
    authorize @products
    render json: @products, meta: pagination_meta(@products)
  end

  def show
    render json: @product
  end

  def create
    @product = current_api_v1_user.products.new(product_params)
    authorize @product
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

  def search
    @products = Product.search(params[:page],params[:size],params[:filter])
    render json: @products, meta: pagination_meta(@products)
  end

  private
    def set_product
      @product = Product.find(params[:id])
      authorize @product
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :user_id)
    end
end
