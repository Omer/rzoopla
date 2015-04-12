require 'net/http'
require 'cgi'
require 'json'
require 'rzoopla/version'
require 'rzoopla/utils'
require 'rzoopla/client'
require 'rzoopla/base_collection'
require 'rzoopla/base_model'
require 'rzoopla/resources'

module RZoopla
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key
  end
end
