class CreateDescriptionTags < ActiveRecord::Migration
  def change
    create_table :description_tags do |t|
      t.string :description
      t.integer :tag_id

      t.timestamps
    end
  end
end
