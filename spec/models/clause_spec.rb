=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 2.0.13
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for LaunchDarklyApi::Clause
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'Clause' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::Clause.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of Clause' do
    it 'should create an instance of Clause' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::Clause)
    end
  end
  describe 'test attribute "attribute"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "op"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "values"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "negate"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

