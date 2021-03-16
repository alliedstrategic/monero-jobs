# frozen_string_literal: true

class AddApplyTypeToPostings < ActiveRecord::Migration[6.0]
  def change
    add_column :postings, :apply_type, :string, null: false, default: ''
  end
end
