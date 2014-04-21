# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  "Auto",
  "Bills",
  "Cash",
  "Check",
  "Childcare",
  "Clothing",
  "Computer",
  "Credit Card Payment",
  "Education",
  "Entertainment",
  "Dining Out",
  "Groceries",
  "Household",
  "Medical",
  "Miscellaneous",
  "Personal",
  "Pet",
  "Recreation",
  "Savings House",
  "Savings Kids",
  "Utilities",
  "Work"
].each do |tag_name|
  Tag.create(name: tag_name, income_expense: "expense")
end

[
  "ATM",
  "Transfer",
  "External Mayo",
  "External Rentpath",
  "External Deposit",
  "Payment"
].each do |tag_name|
  Tag.create(name: tag_name, income_expense: "income")
end
