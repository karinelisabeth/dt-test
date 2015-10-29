# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Inventory.create(
    [
        {
            sku: "123",
            name: "lemon",
            manufacturer: "Fruits Inc",
            cost: 0.32,
            weight: 1.2,
            stock: 500
        },
        {
            sku: "234",
            name: "apple",
            manufacturer: "Fruits Inc",
            cost: 0.30,
            weight: 2.2,
            stock: 300
        }
    ]
)