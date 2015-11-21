# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contacts = Contact.create(
    [
        {
            name:"Contact name 1",
            email: "email1@example.com",
            is_supplier: true,
            is_customer: false,
        },
        {
            name:"Contact name 2",
            email: "email2@example.com",
            is_supplier: true,
            is_customer: false,
        }
        ]
    )

inventories = Inventory.create(
    [
        {
            sku: "123",
            name: "lemon",
            manufacturer: "Supplier1",
            cost: 0.32,
            weight: 1.2,
            stock: 500
        },
        {
            sku: "234",
            name: "apple",
            manufacturer: "Supplier2",
            cost: 0.30,
            weight: 2.2,
            stock: 300
        }
    ]
)

i=0
contacts.each do |c|
    c.inventories << inventories[i]
    i = i+1
end
