class Order < ActiveRecord::Base
  has_many :order_items, dependent: :delete_all

  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? oi.price : 0 }.sum
  end

  def subtotal_cents
    Integer(subtotal * 100)
  end

  def empty?
    subtotal_cents == 0
  end

  def paid!
    self.update_columns(paid: true)
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
