class Tag < ActiveRecord::Base

  has_many :transaction_tags
  has_many :transactions, through: :transaction_tags

  has_many :description_tags
  validates_uniqueness_of :name

  def is_income?
    self.income_expense == "income"
  end

  def is_expense?
    self.income_expense == "expense"
  end
end
