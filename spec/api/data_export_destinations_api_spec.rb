=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 5.0.3
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.17

=end

require 'spec_helper'
require 'json'

# Unit tests for LaunchDarklyApi::DataExportDestinationsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'DataExportDestinationsApi' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::DataExportDestinationsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DataExportDestinationsApi' do
    it 'should create an instance of DataExportDestinationsApi' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::DataExportDestinationsApi)
    end
  end

  # unit tests for delete_destination
  # Get a single data export destination by ID
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param destination_id The data export destination ID.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_destination test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_destination
  # Get a single data export destination by ID
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param destination_id The data export destination ID.
  # @param [Hash] opts the optional parameters
  # @return [Destination]
  describe 'get_destination test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_destinations
  # Returns a list of all data export destinations.
  # @param [Hash] opts the optional parameters
  # @return [Destinations]
  describe 'get_destinations test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for patch_destination
  # Perform a partial update to a data export destination.
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param destination_id The data export destination ID.
  # @param patch_only Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39; Feature flag patches also support JSON Merge Patch format. &#39;https://tools.ietf.org/html/rfc7386&#39; The addition of comments is also supported.
  # @param [Hash] opts the optional parameters
  # @return [Destination]
  describe 'patch_destination test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_destination
  # Create a new data export destination
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param destination_body Create a new data export destination.
  # @param [Hash] opts the optional parameters
  # @return [Destination]
  describe 'post_destination test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
