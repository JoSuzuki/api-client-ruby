=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 3.1.0
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.8

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for LaunchDarklyApi::StreamSDKVersion
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'StreamSDKVersion' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::StreamSDKVersion.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of StreamSDKVersion' do
    it 'should create an instance of StreamSDKVersion' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::StreamSDKVersion)
    end
  end
  describe 'test attribute "_links"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "sdk_versions"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
