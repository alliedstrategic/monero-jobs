class AddSlugToPostings < ActiveRecord::Migration[6.0]
  def change
    add_column :postings, :slug, :string
  end
end
