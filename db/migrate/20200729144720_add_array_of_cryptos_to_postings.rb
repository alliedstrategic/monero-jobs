# frozen_string_literal: true

class AddArrayOfCryptosToPostings < ActiveRecord::Migration[6.0]
  def up
    add_column :postings, :coins, :text, array: true, default: []
  end

  def down
    remove_column :postings, :coins
  end
end
