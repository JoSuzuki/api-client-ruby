=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 4.0.0
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.8

=end

require 'uri'

module LaunchDarklyApi
  class DataExportDestinationsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get a single data export destination by ID
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param destination_id The data export destination ID.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_destination(project_key, environment_key, destination_id, opts = {})
      delete_destination_with_http_info(project_key, environment_key, destination_id, opts)
      nil
    end

    # Get a single data export destination by ID
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param destination_id The data export destination ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_destination_with_http_info(project_key, environment_key, destination_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DataExportDestinationsApi.delete_destination ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling DataExportDestinationsApi.delete_destination"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling DataExportDestinationsApi.delete_destination"
      end
      # verify the required parameter 'destination_id' is set
      if @api_client.config.client_side_validation && destination_id.nil?
        fail ArgumentError, "Missing the required parameter 'destination_id' when calling DataExportDestinationsApi.delete_destination"
      end
      # resource path
      local_var_path = '/destinations/{projectKey}/{environmentKey}/{destinationId}'.sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s).sub('{' + 'destinationId' + '}', destination_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DataExportDestinationsApi#delete_destination\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Get a single data export destination by ID
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param destination_id The data export destination ID.
    # @param [Hash] opts the optional parameters
    # @return [Destination]
    def get_destination(project_key, environment_key, destination_id, opts = {})
      data, _status_code, _headers = get_destination_with_http_info(project_key, environment_key, destination_id, opts)
      data
    end

    # Get a single data export destination by ID
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param destination_id The data export destination ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Destination, Fixnum, Hash)>] Destination data, response status code and response headers
    def get_destination_with_http_info(project_key, environment_key, destination_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DataExportDestinationsApi.get_destination ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling DataExportDestinationsApi.get_destination"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling DataExportDestinationsApi.get_destination"
      end
      # verify the required parameter 'destination_id' is set
      if @api_client.config.client_side_validation && destination_id.nil?
        fail ArgumentError, "Missing the required parameter 'destination_id' when calling DataExportDestinationsApi.get_destination"
      end
      # resource path
      local_var_path = '/destinations/{projectKey}/{environmentKey}/{destinationId}'.sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s).sub('{' + 'destinationId' + '}', destination_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Destination')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DataExportDestinationsApi#get_destination\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Returns a list of all data export destinations.
    # @param [Hash] opts the optional parameters
    # @return [Destinations]
    def get_destinations(opts = {})
      data, _status_code, _headers = get_destinations_with_http_info(opts)
      data
    end

    # Returns a list of all data export destinations.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Destinations, Fixnum, Hash)>] Destinations data, response status code and response headers
    def get_destinations_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DataExportDestinationsApi.get_destinations ...'
      end
      # resource path
      local_var_path = '/destinations'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Destinations')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DataExportDestinationsApi#get_destinations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Perform a partial update to a data export destination.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param destination_id The data export destination ID.
    # @param patch_only Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39; Feature flag patches also support JSON Merge Patch format. &#39;https://tools.ietf.org/html/rfc7386&#39; The addition of comments is also supported.
    # @param [Hash] opts the optional parameters
    # @return [Destination]
    def patch_destination(project_key, environment_key, destination_id, patch_only, opts = {})
      data, _status_code, _headers = patch_destination_with_http_info(project_key, environment_key, destination_id, patch_only, opts)
      data
    end

    # Perform a partial update to a data export destination.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param destination_id The data export destination ID.
    # @param patch_only Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39; Feature flag patches also support JSON Merge Patch format. &#39;https://tools.ietf.org/html/rfc7386&#39; The addition of comments is also supported.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Destination, Fixnum, Hash)>] Destination data, response status code and response headers
    def patch_destination_with_http_info(project_key, environment_key, destination_id, patch_only, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DataExportDestinationsApi.patch_destination ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling DataExportDestinationsApi.patch_destination"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling DataExportDestinationsApi.patch_destination"
      end
      # verify the required parameter 'destination_id' is set
      if @api_client.config.client_side_validation && destination_id.nil?
        fail ArgumentError, "Missing the required parameter 'destination_id' when calling DataExportDestinationsApi.patch_destination"
      end
      # verify the required parameter 'patch_only' is set
      if @api_client.config.client_side_validation && patch_only.nil?
        fail ArgumentError, "Missing the required parameter 'patch_only' when calling DataExportDestinationsApi.patch_destination"
      end
      # resource path
      local_var_path = '/destinations/{projectKey}/{environmentKey}/{destinationId}'.sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s).sub('{' + 'destinationId' + '}', destination_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(patch_only)
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Destination')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DataExportDestinationsApi#patch_destination\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create a new data export destination
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param destination_body Create a new data export destination.
    # @param [Hash] opts the optional parameters
    # @return [Destination]
    def post_destination(project_key, environment_key, destination_body, opts = {})
      data, _status_code, _headers = post_destination_with_http_info(project_key, environment_key, destination_body, opts)
      data
    end

    # Create a new data export destination
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param destination_body Create a new data export destination.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Destination, Fixnum, Hash)>] Destination data, response status code and response headers
    def post_destination_with_http_info(project_key, environment_key, destination_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DataExportDestinationsApi.post_destination ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling DataExportDestinationsApi.post_destination"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling DataExportDestinationsApi.post_destination"
      end
      # verify the required parameter 'destination_body' is set
      if @api_client.config.client_side_validation && destination_body.nil?
        fail ArgumentError, "Missing the required parameter 'destination_body' when calling DataExportDestinationsApi.post_destination"
      end
      # resource path
      local_var_path = '/destinations/{projectKey}/{environmentKey}'.sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(destination_body)
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Destination')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DataExportDestinationsApi#post_destination\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
