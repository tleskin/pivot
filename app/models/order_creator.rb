class OrderCreator

  def self.generate(cart,current_user)
    items = []
    quantities = []
    cart.contents.each do |item, qty|
      items << item
      quantities << qty
    end
    o =  Order.create(user_id: current_user.id, status: "ordered")
    items.map.with_index do |item, i|
      Purchase.create(item_id: item, order_id: o.id, quantity: quantities[i])
    end
  end

end
