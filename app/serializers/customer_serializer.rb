class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :fullname, :phone, :email, :password, :billing_address, :shipping_address, :country
end
