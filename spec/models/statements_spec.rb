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
require 'date'

# Unit tests for LaunchDarklyApi::Statements
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'Statements' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::Statements.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of Statements' do
    it 'should create an instance of Statements' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::Statements)
    end
  end
end

