require 'yaml'

class YamlParser
  def self.parse
    data = YAML.load_file("#{Rails.root}/config/application.yml")
  end
end
