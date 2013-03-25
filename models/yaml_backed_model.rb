require 'active_support/inflector'
require 'yaml'
require 'hashie'

class YamlBackedModel < Hashie::Mash
  
  def block_partial
    f = "#{self.class.to_s.downcase.pluralize}/#{self.html_block_file}"    
    if File.exists? "views/#{f}.erb"
      f.to_sym
    else
      :missing_block
    end
  end

  class << self 

    def data_file
      "data/" + self.to_s.downcase.pluralize + '.yml'
    end

    def load_collection
      fname = data_file
      (File.exists? fname) ? YAML.load(File.open fname) : []
    end

    def all
      # collection method must be defined in the derived classes since
      # it needs it's own private @@collection class variable
      collection
    end

  end
end

