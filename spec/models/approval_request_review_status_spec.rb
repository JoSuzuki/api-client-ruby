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
require 'date'

# Unit tests for LaunchDarklyApi::ApprovalRequestReviewStatus
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ApprovalRequestReviewStatus' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::ApprovalRequestReviewStatus.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ApprovalRequestReviewStatus' do
    it 'should create an instance of ApprovalRequestReviewStatus' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::ApprovalRequestReviewStatus)
    end
  end
end
