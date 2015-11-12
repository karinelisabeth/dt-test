class InventoriesController < ApplicationController
  respond_to :json
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    respond_with Inventory.all
  end

  def show
    respond_with Inventory.find(params[:id])
  end

  def create
    @item = Inventory.create(inventories_params)
    render json: { data: [@item] }.to_json.html_safe
  end

  def update
    @item = Inventory.find(params[:id])
    @item.update inventories_params
    
    render json: { data: [@item] }.to_json.html_safe

  end

  def destroy
    @inventory = Inventory.find(params[:id])
    if @inventory.destroy
      render json: {}
    else
      # handle the error
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @inventory = Inventory.find(params[:id])
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

    params_hash.permit(:id, :sku, :name, :manufacturer, :cost, :weight, :stock, :created_at, :updated_at)
  end

  
end
