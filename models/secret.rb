require File.expand_path(File.join([File.dirname(__FILE__), 'yaml_backed_model.rb']))

class Secret < YamlBackedModel
  @@collection = nil
  
  class << self
    def collection
      unless @@collection
        raw_collection = load_collection
        @@collection = raw_collection.map{|s| Secret.new s} if raw_collection
      end
      @@collection
    end
  end

end
