=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 5.0.0
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.8

=end

require 'spec_helper'
require 'json'

# Unit tests for LaunchDarklyApi::RootApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'RootApi' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::RootApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of RootApi' do
    it 'should create an instance of RootApi' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::RootApi)
    end
  end

  # unit tests for get_root
  # You can issue a GET request to the root resource to find all of the resource categories supported by the API.
  # @param [Hash] opts the optional parameters
  # @return [Links]
  describe 'get_root test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
