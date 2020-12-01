class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :sku, :name, :price, :description, :thumbnail, :category_id
end
