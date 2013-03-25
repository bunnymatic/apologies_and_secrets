require File.dirname(__FILE__) + '/spec_helper'

describe Apology do
  describe 'all' do
    it 'tries to read data/apologies.yml' do
      File.should_receive(:open).with("data/apologies.yml").and_return('stuff')
      YAML.should_receive(:load).with('stuff')
      Apology.all
    end
  end
end
