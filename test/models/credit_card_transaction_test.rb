require 'test_helper'
require 'csv'
require 'pry'

describe CreditCardTransaction do

  let (:filename){'./test/fixtures/credit_data.csv'}
  let (:csv_data){ CSV.read(filename, headers: true) }
  let (:csv_row){ csv_data.first }
  let (:test_params){CreditCardTransaction.translated_values(csv_row)}

  it "#clean_amount" do
    CreditCardTransaction.clean_amount('$1.23').must_equal "1.23"
  end

  it "#create_identifier" do
    identifier = CreditCardTransaction.create_identifier(test_params)
    identifier.wont_be_nil
    identifier.wont_include("$")
  end

end
