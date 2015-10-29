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
    respond_with Inventory.create(inventories_params)
  end

  def update
    @inventory = Inventory.find(params[:id])
    respond_with @inventory.update(inventories_params)
  end

  def destroy
    respond_with Inventory.destroy(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @inventory = Inventory.find(params[:id])
  end

  def inventories_params
    params.require(:inventory).permit(:id, :sku, :name, :manufacturer, :cost, :weight, :stock, :created_at, :updated_at)
  end

  
end
