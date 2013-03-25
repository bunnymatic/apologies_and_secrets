require File.dirname(__FILE__) + '/spec_helper'

describe Secret do
  describe 'all' do
    it 'tries to read data/secrets.yml' do
      File.should_receive(:open).with("data/secrets.yml").and_return('stuff')
      YAML.should_receive(:load).with('stuff')
      Secret.all
    end
  end
end
