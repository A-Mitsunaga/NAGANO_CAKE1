class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

    enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
    def billing_amount

    end
    #validates :payment_method, presence: true


end