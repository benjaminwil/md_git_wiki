require "test_helper"

module Wiki
  class WikiTest < Minitest::Test
    def test_should_have_version_number
      refute_nil ::Wiki::VERSION
    end

    def test_project_root_is_undefined_by_default
      assert_nil Configuration.project_root
    end

    def test_project_readme_requires_project_root
      assert_nil Configuration.project_readme
    end
  end
end
