class CreditCardTransaction < Transaction

  def self.translator
    {
      "Trans Date" => "transaction_date",
      "Description" => "description",
      "Amount" => "amount"
    }
  end

end