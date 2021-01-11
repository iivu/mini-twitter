require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users :Leo
    remember @user
  end

  test 'current_user returns right user when session is nil' do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test 'current_user returns nil when remember digest is wrong' do
    @user.update_attribute :remember_digest, nil
    assert_nil current_user
  end

end