# frozen_string_literal: true

class AddApplyTypeToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :apply_type, :string, null: false, default: ''
  end
end
