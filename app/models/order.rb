class Order
  include Mongoid::Document
  belongs_to :contact
  
  field :order_number, type: String
  field :order_total, type: Float
  field :payment_status, type: String

end