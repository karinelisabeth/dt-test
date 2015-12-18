class OrdersController < ApplicationController
  respond_to :json
  before_action :set_item, except: [:index]
  
  def index
    @items = collection.all
    render json: @items.to_json(include: :contact)
  end

  def show
    render json: @item
  end

  def create
    @item = collection.create(order_params)
  end

  def update
    @item.update_attributes(order_params)
  end

  def destroy
    @item.destroy
  end

  private
  
  def collection
    #apply_scopes Order
    Order
  end
  
  def set_item
    @item = collection.find(params[:id])
  end

  def order_params
      params.require(:order).permit(:id, :order_number, :order_total, :payment_status)
  end

end
