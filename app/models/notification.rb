# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates_presence_of :message, :deliver_at
end
