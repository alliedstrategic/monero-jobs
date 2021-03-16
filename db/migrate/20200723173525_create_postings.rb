# frozen_string_literal: true

class CreatePostings < ActiveRecord::Migration[6.0]
  def change
    create_table :postings do |t|
      t.uuid :user_id, null: false
      t.string :title,    null: false
      t.string :category, null: false
      t.string :posting_type,     null: false
      t.string :headquarters,     null: false
      t.string :regional_restrictions, null: false
      t.string :how_to_apply, null: false

      t.timestamps
    end
  end
end
