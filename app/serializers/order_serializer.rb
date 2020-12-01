class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :customer_id, :amount, :shipping_address, :order_status
end
