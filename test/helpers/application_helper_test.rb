require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal "Amostra App", full_title
    assert_equal "Help | Amostra App", full_title("Help")
  end
end