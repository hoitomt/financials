class TransactionTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :transaction
end
