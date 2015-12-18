class Contact
  include Mongoid::Document
  has_many :inventories
  has_many :orders
  #embeds_many :addresses
  field :name, type: String
  field :email, type: String
  field :is_supplier, type: Boolean
  field :is_customer, type: Boolean

  def as_json(options = {})
     {
         "_id" => _id.to_s,
         :name => name,
         :email => email,
         :is_supplier => is_supplier,
         :is_customer => is_customer,
     }
  end

end