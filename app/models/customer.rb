class Customer < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

   enum is_active: { "有効": true, "退会": false }

  def active_for_authentication?
        super && (self.is_active === "有効")
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    return last_name + first_name
  end

  def full_name_kana
    return last_name_kana + full_name_kana
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

end

