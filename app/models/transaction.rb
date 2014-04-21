class Transaction < ActiveRecord::Base

  has_many :transaction_tags
  has_many :tags, through: :transaction_tags

  validates_uniqueness_of :identifier
  default_scope { order('transaction_date ASC') }

  after_save :auto_set_tag

  def self.process_file(file_name)
    return if file_name.blank?
    csv_table = CSV.read(file_name, headers: true)
    csv_table.inject(0) {|sum, csv_row| sum += add_row_to_database(csv_row) }
  end

  def self.add_row_to_database(csv_row)
    Transaction.create(filtered_params(csv_row)).valid? ? 1 : 0
  end

  def self.filtered_params(csv_row)
    new_params = translated_values(csv_row)
    {
      transaction_date: DateUtils.parse_date(new_params['transaction_date']),
      amount: clean_amount(new_params['amount']),
      description: new_params['description'],
      identifier: create_identifier(new_params)
    }
  end

  def self.translated_values(csv_row)
    {}.tap do |h|
      csv_row.each {|k, v| h[db_key(k)] = v}
    end
  end

  def self.db_key(key)
    translator.fetch(key, '')
  end

  def self.create_identifier(params)
    Digest::SHA1.hexdigest params.to_s
  end

  def self.clean_amount(amt)
    amt ? amt.gsub('$', '') : '0.0'
  end

  def transaction_date_display
    transaction_date.strftime("%-m/%-d/%Y")
  end

  def auto_set_tag
    dtag = DescriptionTag.seek_by_description(self.description)
    TransactionTag.create(transaction_id: self.id, tag_id: dtag.tag_id) if dtag.present?
  end

  def tags_display
    self.tags.map{ |tag| tag.name }.join(', ')
  end

end
