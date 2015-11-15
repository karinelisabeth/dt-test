class InventoriesController < ApplicationController
  respond_to :json
  before_action :set_item, only: [:show, :edit]
  before_action :set_multiple_items, only: [:update, :destroy]
  has_scope :by_sku, as: :sku
  
  def index
    respond_with collection.all
  end

  def show
    respond_with collection.find(params[:id])
  end

  def create
    @item = collection.create(inventories_params)
    render json: { data: [@item] }.to_json.html_safe
  end

  def update
    @items.each do |item|
      item.update_attributes params['data'][item.id.to_s].permit(:sku, :name, :manufacturer, :cost, :weight, :stock)
    end
    render json: { data: @items }.to_json.html_safe
  end

  def destroy
    @items.each do |item|
      item.destroy
    end
    render json: {}
  end

  private
  
  def collection
    apply_scopes Inventory
  end
  
  def set_multiple_items
    params_ids = params[:id].split(',')
    @items = collection.find(params_ids)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @inventory = collection.find(params[:id])
  end

  def inventories_params
    id = params[:id] || '0'
    
    params_hash = ActionController::Parameters.new(
      {
        sku: params['data'][id]['sku'],
        name: params['data'][id]['name'],
        manufacturer: params['data'][id]['manufacturer'],
        cost: params['data'][id]['cost'],
        weight: params['data'][id]['weight'],
        stock: params['data'][id]['stock']
      }
    )

    params_hash.permit(:id, :sku, :name, :manufacturer, :cost, :weight, :stock)
  end

  
end
