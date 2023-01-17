# frozen_string_literal: true

require 'test_helper'

class UserValidationTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'test@example.com', nickname: 'test_user', password: '123456')
    assert user.valid?
  end

  test 'invalid without nickname' do
    user = User.new(email: 'test@example.com', password: '123456')
    refute user.valid?, 'user is valid without a nickname'
    assert_not_nil user.errors[:nickname], 'no validation error for nickname present'
  end
end
