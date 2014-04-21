require 'test_helper'
require 'csv'
require 'pry'

describe CheckingTransaction do

  let (:filename){'./test/fixtures/checking_data.csv'}
  let (:csv_data){ CSV.read(filename, headers: true) }
  let (:csv_row){ csv_data.first }

  it "should be true" do
    assert true
  end

  it "should translate the keys" do
    parsed = CheckingTransaction.translated_values(csv_row)
    assert parsed.has_key?("description")
  end

  it "should translate the keys with correct values" do
    parsed = CheckingTransaction.translated_values(csv_row)
    assert parsed["amount"].must_equal '-10.00'
  end

  it "should add a record to the database" do
    CheckingTransaction.process_file(filename)
    CheckingTransaction.count.must_equal 1
  end

  it "should not insert multiple records with the same identifier" do
    CheckingTransaction.process_file(filename)
    CheckingTransaction.process_file(filename).must_equal 0
    CheckingTransaction.count.must_equal 1
  end

  it "should return a count" do
    CheckingTransaction.delete_all
    CheckingTransaction.process_file(filename).must_equal 1
  end

  it "should have the correct identifier" do
    CheckingTransaction.process_file(filename)
    c = CheckingTransaction.all.first
    c.amount.must_equal -10.00
  end
end
