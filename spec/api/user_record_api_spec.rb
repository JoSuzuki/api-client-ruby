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

# Unit tests for LaunchDarklyApi::UserRecordApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'UserRecordApi' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::UserRecordApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of UserRecordApi' do
    it 'should create an instance of UserRecordApi' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::UserRecordApi)
    end
  end

  # unit tests for get_user
  # Get a user by key.
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param user_key The user&#39;s key.
  # @param [Hash] opts the optional parameters
  # @return [User]
  describe 'get_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
