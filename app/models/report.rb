module Report

  def income_summary
    income_transactions.inject(0){|sum, t| sum += t.amount.abs}
  end

  def expense_summary
    expense_transactions.inject(0){|sum, t| sum += t.amount.abs}
  end

  def income_transactions
    @income_transactions ||= transactions.select{ |trans| trans.tags.first.is_income? }
  end

  def expense_transactions
    @expense_transactions ||= transactions.select{ |trans| trans.tags.first.is_expense? }
  end

end