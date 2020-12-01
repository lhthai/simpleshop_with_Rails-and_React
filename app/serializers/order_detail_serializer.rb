class OrderDetailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :order_id, :product_id, :price, :quantity
end
