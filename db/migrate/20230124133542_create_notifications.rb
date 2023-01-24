# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.datetime :deliver_at
      t.bigint :owner_id, class_name: 'User', foreign_key: 'owner_id'

      t.timestamps
    end
  end
end
