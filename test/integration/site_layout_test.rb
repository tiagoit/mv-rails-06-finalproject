require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'layout links' do
    @user = users(:one)

    # not logged in users - redirect to /login
    get root_path
    assert_redirected_to new_user_session_path

    sign_in @user
    get root_path
    assert_template 'static_pages/home'

    # Home links
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', users_path, count: 1
    assert_select 'a[href=?]', user_path(users(:one)), count: 1
    assert_select 'a[href=?]', posts_path, count: 1
  end
end
