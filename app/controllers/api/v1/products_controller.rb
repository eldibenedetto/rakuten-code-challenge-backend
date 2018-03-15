class Api::V1::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
    render json: @products, status: 200
  end

  def create
  end

  def show
  end

  def update
  end

  def delete
  end


end
