require 'spec_helper'

class Foo
  def foo_method
    secondary_call
  end

  def secondary_call
    inner_call
  end

  def inner_call
    'Fubar'
  end
end

describe Foo do
  before :each do
    @foo = Foo.new
    @foo.stub(:inner_call).and_return('Bar')
  end

  it 'should return bar' do
    @foo.foo_method.should eq 'Bar'
  end
end
