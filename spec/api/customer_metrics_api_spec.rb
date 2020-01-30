=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 2.0.26
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.8

=end

require 'spec_helper'
require 'json'

# Unit tests for LaunchDarklyApi::CustomerMetricsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'CustomerMetricsApi' do
  before do
    # run before each test
    @instance = LaunchDarklyApi::CustomerMetricsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CustomerMetricsApi' do
    it 'should create an instance of CustomerMetricsApi' do
      expect(@instance).to be_instance_of(LaunchDarklyApi::CustomerMetricsApi)
    end
  end

  # unit tests for get_evaluations
  # Get events usage by event id and the feature flag key.
  # @param env_id The environment id for the flag evaluations in question.
  # @param flag_key The key of the flag we want metrics for.
  # @param [Hash] opts the optional parameters
  # @return [StreamSDKVersion]
  describe 'get_evaluations test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_event
  # Get events usage by event type.
  # @param type The type of event we would like to track.
  # @param [Hash] opts the optional parameters
  # @return [StreamSDKVersion]
  describe 'get_event test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_events
  # Get events usage endpoints.
  # @param [Hash] opts the optional parameters
  # @return [Events]
  describe 'get_events test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_mau
  # Get monthly active user data.
  # @param [Hash] opts the optional parameters
  # @return [MAU]
  describe 'get_mau test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_mau_by_category
  # Get monthly active user data by category.
  # @param [Hash] opts the optional parameters
  # @return [MAUbyCategory]
  describe 'get_mau_by_category test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_stream
  # Get a stream endpoint and return timeseries data.
  # @param source The source of where the stream comes from.
  # @param [Hash] opts the optional parameters
  # @return [Stream]
  describe 'get_stream test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_stream_by_sdk
  # Get a stream timeseries data by source show sdk version metadata.
  # @param source The source of where the stream comes from.
  # @param [Hash] opts the optional parameters
  # @return [StreamBySDK]
  describe 'get_stream_by_sdk test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_stream_sdk_version
  # Get a stream timeseries data by source and show all sdk version associated.
  # @param source The source of where the stream comes from.
  # @param [Hash] opts the optional parameters
  # @return [StreamSDKVersion]
  describe 'get_stream_sdk_version test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_streams
  # Returns a list of all streams.
  # @param [Hash] opts the optional parameters
  # @return [Streams]
  describe 'get_streams test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_usage
  # Returns of the usage endpoints available.
  # @param [Hash] opts the optional parameters
  # @return [Usage]
  describe 'get_usage test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
