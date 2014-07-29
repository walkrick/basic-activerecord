require "./lib/connection"
require "./lib/customer"
require "./lib/item"
require "./lib/orderitem"
require "./lib/order"
require "awesome_print"



# p Customer.all

# p Customer.first

# p Customer.last

# p Customer.find_by(id: 3)

# p Customer.where(state: "Colorado")

# p Customer.where(id: (1..5))

# p Customer.all.order('name ASC')

# p Customer.all.order('name DESC')

# p Item.all

# p Item.where("name LIKE (?)", "%boot%")

# p Order.all

# p Order.where(id: (1..5))

# lastOrderId = Order.last[:id]
# p Order.where(id: ((lastOrderId-5)..lastOrderId))

# p Customer.pluck(:name, :email)

# p Customer.pluck(:id, :name, :address)

# p Customer.count

# p Order.sum(:amount).to_f

# p Order.where(customer_id: 1).sum(:amount).to_f

# p Order.average(:amount).to_f.round(2)

# p Order.minimum(:amount).to_f

# p Order.maximum(:amount).to_f

# ap Order.select(:customer_id, :amount).group(:customer_id).minimum(:amount)

# ap Order.select(:customer_id, :amount).group(:customer_id).maximum(:amount)

# ap Customer.where(state: "Colorado")

# ap Customer.where(city: "Rigobertoside")

# ap Customer.where(:state => ["Ohio", "Virginia"])

# ap Item.find_by(description: "snow board").update(:name => "board01")
# ap Item.find_by(name: "board01")

# ap Item.create(name: "kayak01", description: "one person river kayak")

# ap Item.find_by(name: "kayak01").destroy

# ap Order.select(:customer_id, :amount).group(:customer_id).sum(:amount)

# display the order id, customer name and order amount for each order
# Order.select(:amount, 'customers.name', 'orders.id').joins(:customer).each do |order|
#   ap order[:id]
#   ap order[:name]
#   ap order[:amount]
# end

Order.select(:customer_id, 'customers.name', 'orders.amount').joins(:customer).group('customer.name', 'customer.id').each do |customer|
  ap customer[:customer_id]
  ap customer[:name]
  ap customer[:amount]
end
