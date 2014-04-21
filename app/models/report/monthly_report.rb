module Report
  class MonthlyReport
    include Report

    def initialize(month)
      @month = month
    end

    def month_name
      Date::MONTHNAMES[@month]
    end

    def transactions
      @transactions ||= Transaction.where('extract(month from transaction_date) = ?', @month)
    end
  end
end