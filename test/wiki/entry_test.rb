require 'test_helper'

module Wiki
  class EntryTest < Minitest::Test

    include ::Wiki::Mock

    def setup
      create_wiki
    end
  end
end
