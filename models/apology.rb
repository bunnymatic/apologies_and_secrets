require File.expand_path(File.join([File.dirname(__FILE__), 'yaml_backed_model.rb']))

class Apology < YamlBackedModel
  @@collection = nil

  class << self
    def collection
      unless @@collection
        raw_collection = load_collection
        @@collection = raw_collection.map{|a| Apology.new a} if raw_collection
      end
      @@collection
    end
  end

end
