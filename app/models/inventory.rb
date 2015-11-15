class Inventory 
  include Mongoid::Document
  field :sku, type: String
  field :name, type: String
  field :manufacturer, type: String
  field :cost, type: Float
  field :weight, type: Float
  field :stock, type: Integer
    
  scope :by_sku, -> sku { where(sku: sku) }


  def as_json(options = {})
     {
         "_id" => _id.to_s,
         :sku => sku,
         :name => name,
         :manufacturer => manufacturer,
         :cost => cost,
         :weight => weight,
         :stock => stock
     }
  end

# {"_id":{"$oid":"563260d9e05e1c0afa000000"},"cost":0.32,"manufacturer":"Fruits Inc","name":"lemon","sku":"123","stock":500,"weight":1.2}

end

