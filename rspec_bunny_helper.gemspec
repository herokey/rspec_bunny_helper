# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'rspec_bunny_helper/version'

Gem::Specification.new do |s|
  s.name = 'rspec_bunny_helper'
  s.version = RspecBunnyHelper::VERSION
  s.required_ruby_version = '>= 2.7.0'
  s.license = 'MIT'
  s.platform = Gem::Platform::RUBY

  s.authors = ['Nataliya Bondarenko']
  s.email = ['nataliya.bondarenko17@gmail.com']
  s.description = 'Mocks Bunny service for testing purposes'

  s.homepage = 'https://github.com/herokey'
  s.metadata = {
    'changelog_uri' => 'https://github.com/teamcapybara/capybara/blob/master/History.md',
    'source_code_uri' => 'https://github.com/teamcapybara/capybara',
    'rubygems_mfa_required' => 'true'
  }
  s.files = ['lib/rspec_bunny_helper.rb', 'README.md']
  s.summary = 'Gem aims to substitute the RabbitMQ connection in local testing environment'

  s.add_development_dependency 'rubocop', '~> 0.75'
end
