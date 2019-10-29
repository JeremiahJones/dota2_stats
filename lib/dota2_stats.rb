# frozen_string_literal: true

require 'active_support/concern'
require 'active_support/core_ext/string'
require 'base64'
require 'httpclient'
require 'json'

require 'dota2_stats/version'
require 'dota2_stats/v1'
require 'dota2_stats/configuration'

module Dota2Stats
  def self.configure
    yield(configuration)
  end

  def self.configuration
    @config ||= Dota2Stats::Configuration.new
  end

  class << self
    alias config configuration
  end

  config
end

require 'dota2_stats/railtie' if defined?(Rails)
