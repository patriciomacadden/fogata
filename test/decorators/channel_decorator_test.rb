require 'test_helper'

class ChannelDecoratorTest < ActiveSupport::TestCase
  def setup
    ApplicationController.new.view_context
  end
end
