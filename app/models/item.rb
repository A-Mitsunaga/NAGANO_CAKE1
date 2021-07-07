class Item < ApplicationRecord
  attachment :image
  has_many :cart_items
  has_many :order_items

  enum is_active: { '販売中': true,'販売中止': false }

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :image, presence: true

end