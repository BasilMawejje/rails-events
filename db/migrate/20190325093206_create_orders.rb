# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :quantity

      t.timestamps
    end
    add_index :orders, %i[event_id user_id]
  end
end
