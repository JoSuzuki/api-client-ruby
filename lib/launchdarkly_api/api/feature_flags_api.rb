=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 2.0.13
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require "uri"

module LaunchDarklyApi
  class FeatureFlagsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Copies the feature flag configuration from one environment to the same feature flag in another environment.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [FeatureFlag]
    def copy_feature_flag(project_key, environment_key, feature_flag_key, opts = {})
      data, _status_code, _headers = copy_feature_flag_with_http_info(project_key, environment_key, feature_flag_key, opts)
      return data
    end

    # Copies the feature flag configuration from one environment to the same feature flag in another environment.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [Array<(FeatureFlag, Fixnum, Hash)>] FeatureFlag data, response status code and response headers
    def copy_feature_flag_with_http_info(project_key, environment_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: FeatureFlagsApi.copy_feature_flag ..."
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.copy_feature_flag"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling FeatureFlagsApi.copy_feature_flag"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.copy_feature_flag"
      end
      # resource path
      local_var_path = "/flags/{projectKey}/{environmentKey}/{featureFlagKey}/copy".sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s).sub('{' + 'featureFlagKey' + '}', feature_flag_key.to_s)

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
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'FeatureFlag')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#copy_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_feature_flag(project_key, feature_flag_key, opts = {})
      delete_feature_flag_with_http_info(project_key, feature_flag_key, opts)
      return nil
    end

    # Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_feature_flag_with_http_info(project_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: FeatureFlagsApi.delete_feature_flag ..."
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.delete_feature_flag"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.delete_feature_flag"
      end
      # resource path
      local_var_path = "/flags/{projectKey}/{featureFlagKey}".sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'featureFlagKey' + '}', feature_flag_key.to_s)

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
        @api_client.config.logger.debug "API called: FeatureFlagsApi#delete_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a single feature flag by key.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env&#x3D;production will restrict the returned configurations to just your production environment.
    # @return [FeatureFlag]
    def get_feature_flag(project_key, feature_flag_key, opts = {})
      data, _status_code, _headers = get_feature_flag_with_http_info(project_key, feature_flag_key, opts)
      return data
    end

    # Get a single feature flag by key.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env&#x3D;production will restrict the returned configurations to just your production environment.
    # @return [Array<(FeatureFlag, Fixnum, Hash)>] FeatureFlag data, response status code and response headers
    def get_feature_flag_with_http_info(project_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: FeatureFlagsApi.get_feature_flag ..."
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.get_feature_flag"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.get_feature_flag"
      end
      # resource path
      local_var_path = "/flags/{projectKey}/{featureFlagKey}".sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'featureFlagKey' + '}', feature_flag_key.to_s)

      # query parameters
      query_params = {}
      query_params[:'env'] = opts[:'env'] if !opts[:'env'].nil?

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
        :return_type => 'FeatureFlag')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the status for a particular feature flag.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [FeatureFlagStatus]
    def get_feature_flag_status(project_key, environment_key, feature_flag_key, opts = {})
      data, _status_code, _headers = get_feature_flag_status_with_http_info(project_key, environment_key, feature_flag_key, opts)
      return data
    end

    # Get the status for a particular feature flag.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [Array<(FeatureFlagStatus, Fixnum, Hash)>] FeatureFlagStatus data, response status code and response headers
    def get_feature_flag_status_with_http_info(project_key, environment_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: FeatureFlagsApi.get_feature_flag_status ..."
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.get_feature_flag_status"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling FeatureFlagsApi.get_feature_flag_status"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.get_feature_flag_status"
      end
      # resource path
      local_var_path = "/flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey}".sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s).sub('{' + 'featureFlagKey' + '}', feature_flag_key.to_s)

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
        :return_type => 'FeatureFlagStatus')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flag_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param [Hash] opts the optional parameters
    # @return [FeatureFlagStatuses]
    def get_feature_flag_statuses(project_key, environment_key, opts = {})
      data, _status_code, _headers = get_feature_flag_statuses_with_http_info(project_key, environment_key, opts)
      return data
    end

    # Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param [Hash] opts the optional parameters
    # @return [Array<(FeatureFlagStatuses, Fixnum, Hash)>] FeatureFlagStatuses data, response status code and response headers
    def get_feature_flag_statuses_with_http_info(project_key, environment_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: FeatureFlagsApi.get_feature_flag_statuses ..."
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.get_feature_flag_statuses"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling FeatureFlagsApi.get_feature_flag_statuses"
      end
      # resource path
      local_var_path = "/flag-statuses/{projectKey}/{environmentKey}".sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s)

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
        :return_type => 'FeatureFlagStatuses')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flag_statuses\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a list of all features in the given project.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env&#x3D;production will restrict the returned configurations to just your production environment.
    # @option opts [String] :tag Filter by tag. A tag can be used to group flags across projects.
    # @return [FeatureFlags]
    def get_feature_flags(project_key, opts = {})
      data, _status_code, _headers = get_feature_flags_with_http_info(project_key, opts)
      return data
    end

    # Get a list of all features in the given project.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env&#x3D;production will restrict the returned configurations to just your production environment.
    # @option opts [String] :tag Filter by tag. A tag can be used to group flags across projects.
    # @return [Array<(FeatureFlags, Fixnum, Hash)>] FeatureFlags data, response status code and response headers
    def get_feature_flags_with_http_info(project_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: FeatureFlagsApi.get_feature_flags ..."
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.get_feature_flags"
      end
      # resource path
      local_var_path = "/flags/{projectKey}".sub('{' + 'projectKey' + '}', project_key.to_s)

      # query parameters
      query_params = {}
      query_params[:'env'] = opts[:'env'] if !opts[:'env'].nil?
      query_params[:'tag'] = opts[:'tag'] if !opts[:'tag'].nil?

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
        :return_type => 'FeatureFlags')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Perform a partial update to a feature.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param patch_comment Requires a JSON Patch representation of the desired changes to the project, and an optional comment. &#39;http://jsonpatch.com/&#39; Feature flag patches also support JSON Merge Patch format. &#39;https://tools.ietf.org/html/rfc7386&#39; The addition of comments is also supported.
    # @param [Hash] opts the optional parameters
    # @return [FeatureFlag]
    def patch_feature_flag(project_key, feature_flag_key, patch_comment, opts = {})
      data, _status_code, _headers = patch_feature_flag_with_http_info(project_key, feature_flag_key, patch_comment, opts)
      return data
    end

    # Perform a partial update to a feature.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param patch_comment Requires a JSON Patch representation of the desired changes to the project, and an optional comment. &#39;http://jsonpatch.com/&#39; Feature flag patches also support JSON Merge Patch format. &#39;https://tools.ietf.org/html/rfc7386&#39; The addition of comments is also supported.
    # @param [Hash] opts the optional parameters
    # @return [Array<(FeatureFlag, Fixnum, Hash)>] FeatureFlag data, response status code and response headers
    def patch_feature_flag_with_http_info(project_key, feature_flag_key, patch_comment, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: FeatureFlagsApi.patch_feature_flag ..."
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.patch_feature_flag"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.patch_feature_flag"
      end
      # verify the required parameter 'patch_comment' is set
      if @api_client.config.client_side_validation && patch_comment.nil?
        fail ArgumentError, "Missing the required parameter 'patch_comment' when calling FeatureFlagsApi.patch_feature_flag"
      end
      # resource path
      local_var_path = "/flags/{projectKey}/{featureFlagKey}".sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'featureFlagKey' + '}', feature_flag_key.to_s)

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
      post_body = @api_client.object_to_http_body(patch_comment)
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'FeatureFlag')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#patch_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Creates a new feature flag.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param feature_flag_body Create a new feature flag.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :clone The key of the feature flag to be cloned. The key identifies the flag in your code.  For example, setting clone&#x3D;flagKey will copy the full targeting configuration for all environments (including on/off state) from the original flag to the new flag.
    # @return [FeatureFlag]
    def post_feature_flag(project_key, feature_flag_body, opts = {})
      data, _status_code, _headers = post_feature_flag_with_http_info(project_key, feature_flag_body, opts)
      return data
    end

    # Creates a new feature flag.
    # 
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param feature_flag_body Create a new feature flag.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :clone The key of the feature flag to be cloned. The key identifies the flag in your code.  For example, setting clone&#x3D;flagKey will copy the full targeting configuration for all environments (including on/off state) from the original flag to the new flag.
    # @return [Array<(FeatureFlag, Fixnum, Hash)>] FeatureFlag data, response status code and response headers
    def post_feature_flag_with_http_info(project_key, feature_flag_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: FeatureFlagsApi.post_feature_flag ..."
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.post_feature_flag"
      end
      # verify the required parameter 'feature_flag_body' is set
      if @api_client.config.client_side_validation && feature_flag_body.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_body' when calling FeatureFlagsApi.post_feature_flag"
      end
      # resource path
      local_var_path = "/flags/{projectKey}".sub('{' + 'projectKey' + '}', project_key.to_s)

      # query parameters
      query_params = {}
      query_params[:'clone'] = opts[:'clone'] if !opts[:'clone'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(feature_flag_body)
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'FeatureFlag')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#post_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
