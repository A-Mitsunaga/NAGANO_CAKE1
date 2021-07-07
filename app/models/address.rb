class Address < ApplicationRecord
  belongs_to :customer
  def postal_code_address_name
    return postal_code + address + name
  end
end