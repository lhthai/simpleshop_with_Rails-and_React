class Order < ApplicationRecord
    enum order_status: [ :pending, :canceled, :completed ]
    belongs_to :customer
end
