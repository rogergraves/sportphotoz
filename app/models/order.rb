class Order < ActiveRecord::Base
  has_many :order_items, dependent: :delete_all

  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? oi.price : 0 }.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
