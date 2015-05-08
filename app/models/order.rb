class Order < ActiveRecord::Base
  has_many :order_items, dependent: :delete_all

  before_create :generate_slug
  before_save :update_subtotal

  scope :paid, -> { where(paid: true) }
  scope :not_paid, -> { where(paid: false) }

  def subtotal
    order_items.collect { |oi| oi.valid? ? oi.price : 0 }.sum
  end

  def subtotal_cents
    Integer(subtotal * 100)
  end

  def empty?
    subtotal_cents == 0
  end

  def paid!(email)
    self.update_columns(paid: true, email: email)
  end

  def to_param
    slug
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def generate_slug
    loop do
      new_slug = SecureRandom.hex(20)
      unless Order.exists?(slug: new_slug)
        self.slug = new_slug
        break
      end
    end
  end
end
