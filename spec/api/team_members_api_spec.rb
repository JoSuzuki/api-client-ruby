=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 2.0.4
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require 'spec_helper'
require 'json'

# Unit tests for LaunchDarklyApi::TeamMembersApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TeamMembersApi' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::TeamMembersApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TeamMembersApi' do
    it 'should create an instance of TeamMembersApi' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::TeamMembersApi)
    end
  end

  # unit tests for delete_member
  # Delete a team member by ID.
  # 
  # @param member_id The member ID.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_member test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_member
  # Get a single team member by ID.
  # 
  # @param member_id The member ID.
  # @param [Hash] opts the optional parameters
  # @return [Member]
  describe 'get_member test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_members
  # Returns a list of all members in the account.
  # 
  # @param [Hash] opts the optional parameters
  # @return [Members]
  describe 'get_members test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for patch_member
  # Modify a team member by ID.
  # 
  # @param member_id The member ID.
  # @param patch_delta Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39;
  # @param [Hash] opts the optional parameters
  # @return [Member]
  describe 'patch_member test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_members
  # Invite new members.
  # 
  # @param members_body New members to invite.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'post_members test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
