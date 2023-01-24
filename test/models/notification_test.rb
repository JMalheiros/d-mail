# frozen_string_literal: true

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  user = User.new(email: 'test@example.com', nickname: 'test_user', password: '123456')

  test 'valid notification' do
    notification = Notification.new(owner: user, message: 'Some message', deliver_at: Time.now.to_datetime)
    assert notification.valid?
  end

  test 'invalid without owner' do
    notification = Notification.new(message: 'Some message', deliver_at: Time.now.to_datetime)
    refute notification.valid?, 'notification is valid without a owner'
    assert_not_nil notification.errors[:owner], 'no validation error for owner present'
  end

  test 'invalid without message' do
    notification = Notification.new(owner: user, deliver_at: Time.now.to_datetime)
    refute notification.valid?, 'notification is valid without a message'
    assert_not_nil notification.errors[:message], 'no validation error for message present'
  end

  test 'invalid without deliver_at' do
    notification = Notification.new(owner: user, message: 'Some message')
    refute notification.valid?, 'notification is valid without a deliver_at'
    assert_not_nil notification.errors[:deliver_at], 'no validation error for deliver_at present'
  end
end
