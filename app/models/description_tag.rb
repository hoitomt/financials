class DescriptionTag < ActiveRecord::Base

  belongs_to :tag
  validates_uniqueness_of :description
  default_scope { order('description ASC') }

  def self.seek_by_description(q)
    search_by_description(q).first
  end

  def self.search_by_description(q)
    DescriptionTag.where("description LIKE ?", "%#{q}%")
  end

  def self.process_file(file_name)
    return if file_name.blank?
    csv_table = CSV.read(file_name, headers: true)
    csv_table.inject(0) {|sum, csv_row| sum += add_row_to_database(csv_row) }
  end

  def self.add_row_to_database(csv_row)
    tag = Tag.find_by_name(csv_row['tag_name'])
    DescriptionTag.create(description: csv_row['description'], tag_id: tag.id).valid? ? 1 : 0
  end

end
