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
         "_id" => _id.to_s,
         :sku => sku,
         :name => name,
         :manufacturer => manufacturer,
         :"contact_name" => contact_name,
         :"contact_id" => contact_id,
         :cost => cost,
         :weight => weight,
         :stock => stock
     }
  end

end
