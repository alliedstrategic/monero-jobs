# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.uuid :user_id, null: false
      t.string :title, null: false
      t.string :category, null: false
      t.string :how_to_contact, null: false

      t.timestamps
    end
    add_column :services, :coins, :text, array: true, default: []
  end
end
