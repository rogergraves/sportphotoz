class OrderItem < ActiveRecord::Base
  belongs_to :photo
  belongs_to :order

  validates :photo, presence: true, uniqueness: true
  validates :order, presence: true

  before_save :set_price

  def price
    if persisted?
      self[:price]
    else
      photo.price
    end
  end

  private

  def set_price
    self[:price] = price
  end
end
