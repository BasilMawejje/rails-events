# frozen_string_literal: true

class CreateEventCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :event_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
