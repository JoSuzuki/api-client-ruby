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

# Unit tests for LaunchDarklyApi::UserSegmentsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'UserSegmentsApi' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::UserSegmentsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of UserSegmentsApi' do
    it 'should create an instance of UserSegmentsApi' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::UserSegmentsApi)
    end
  end

  # unit tests for delete_user_segment
  # Delete a user segment.
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param user_segment_key The user segment&#39;s key. The key identifies the user segment in your code.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_user_segment test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_user_segment
  # Get a single user segment by key.
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param user_segment_key The user segment&#39;s key. The key identifies the user segment in your code.
  # @param [Hash] opts the optional parameters
  # @return [UserSegment]
  describe 'get_user_segment test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_user_segments
  # Get a list of all user segments in the given project.
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :tag Filter by tag. A tag can be used to group flags across projects.
  # @return [UserSegments]
  describe 'get_user_segments test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for patch_user_segment
  # Perform a partial update to a user segment.
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param user_segment_key The user segment&#39;s key. The key identifies the user segment in your code.
  # @param patch_only Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39; Feature flag patches also support JSON Merge Patch format. &#39;https://tools.ietf.org/html/rfc7386&#39; The addition of comments is also supported.
  # @param [Hash] opts the optional parameters
  # @return [UserSegment]
  describe 'patch_user_segment test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_user_segment
  # Creates a new user segment.
  # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
  # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
  # @param user_segment_body Create a new user segment.
  # @param [Hash] opts the optional parameters
  # @return [UserSegment]
  describe 'post_user_segment test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
