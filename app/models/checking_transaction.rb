class CheckingTransaction < Transaction

  def self.translator
    {
      "Posting Date" => "transaction_date",
      "Amount" => "amount",
      "Description" => "description"
    }
  end

end