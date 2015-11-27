class Inventory 
  include Mongoid::Document

  field :sku, type: String
  field :name, type: String
  field :manufacturer, type: String
  field :cost, type: Float
  field :weight, type: Float
  field :stock, type: Integer
    
  scope :by_sku, -> sku { where(sku: sku) }

  belongs_to :contact
  accepts_nested_attributes_for :contact
  delegate :name, :to => :contact, :allow_nil => true, :prefix => true
  
  def as_json(options = {})
     {
         'DT_RowId': _id.to_s,
         inventories: {
           sku: sku,
           name: name,
           manufacturer: manufacturer,
           contact_id: contact_id.to_s,
           cost: cost,
           weight: weight,
           stock: stock
         },
         contacts:{
           name: contact_name
         }
         
     }
  end

end
