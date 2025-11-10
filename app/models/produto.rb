class Produto < ApplicationRecord
  belongs_to :category, optional: true

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.current)
  end

  scope :deleted, -> { unscope(where: :deleted_at).where.not(deleted_at: nil) }
end
