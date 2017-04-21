require 'test_helper'

class VdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vd = vds(:one)
  end

  test "should get index" do
    get vds_url
    assert_response :success
  end

  test "should get new" do
    get new_vd_url
    assert_response :success
  end

  test "should create vd" do
    assert_difference('Vd.count') do
      post vds_url, params: { vd: { email: @vd.email, name: @vd.name } }
    end

    assert_redirected_to vd_url(Vd.last)
  end

  test "should show vd" do
    get vd_url(@vd)
    assert_response :success
  end

  test "should get edit" do
    get edit_vd_url(@vd)
    assert_response :success
  end

  test "should update vd" do
    patch vd_url(@vd), params: { vd: { email: @vd.email, name: @vd.name } }
    assert_redirected_to vd_url(@vd)
  end

  test "should destroy vd" do
    assert_difference('Vd.count', -1) do
      delete vd_url(@vd)
    end

    assert_redirected_to vds_url
  end
end
