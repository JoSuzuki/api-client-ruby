=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 2.0.23
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.8

=end

require 'uri'

module LaunchDarklyApi
  class UserSettingsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Fetch a single flag setting for a user by key.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param user_key The user&#39;s key.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [UserFlagSetting]
    def get_user_flag_setting(project_key, environment_key, user_key, feature_flag_key, opts = {})
      data, _status_code, _headers = get_user_flag_setting_with_http_info(project_key, environment_key, user_key, feature_flag_key, opts)
      data
    end

    # Fetch a single flag setting for a user by key.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param user_key The user&#39;s key.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [Array<(UserFlagSetting, Fixnum, Hash)>] UserFlagSetting data, response status code and response headers
    def get_user_flag_setting_with_http_info(project_key, environment_key, user_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UserSettingsApi.get_user_flag_setting ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling UserSettingsApi.get_user_flag_setting"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling UserSettingsApi.get_user_flag_setting"
      end
      # verify the required parameter 'user_key' is set
      if @api_client.config.client_side_validation && user_key.nil?
        fail ArgumentError, "Missing the required parameter 'user_key' when calling UserSettingsApi.get_user_flag_setting"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling UserSettingsApi.get_user_flag_setting"
      end
      # resource path
      local_var_path = '/users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey}'.sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s).sub('{' + 'userKey' + '}', user_key.to_s).sub('{' + 'featureFlagKey' + '}', feature_flag_key.to_s)

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
        :return_type => 'UserFlagSetting')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserSettingsApi#get_user_flag_setting\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Fetch a single flag setting for a user by key.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param user_key The user&#39;s key.
    # @param [Hash] opts the optional parameters
    # @return [UserFlagSettings]
    def get_user_flag_settings(project_key, environment_key, user_key, opts = {})
      data, _status_code, _headers = get_user_flag_settings_with_http_info(project_key, environment_key, user_key, opts)
      data
    end

    # Fetch a single flag setting for a user by key.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param user_key The user&#39;s key.
    # @param [Hash] opts the optional parameters
    # @return [Array<(UserFlagSettings, Fixnum, Hash)>] UserFlagSettings data, response status code and response headers
    def get_user_flag_settings_with_http_info(project_key, environment_key, user_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UserSettingsApi.get_user_flag_settings ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling UserSettingsApi.get_user_flag_settings"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling UserSettingsApi.get_user_flag_settings"
      end
      # verify the required parameter 'user_key' is set
      if @api_client.config.client_side_validation && user_key.nil?
        fail ArgumentError, "Missing the required parameter 'user_key' when calling UserSettingsApi.get_user_flag_settings"
      end
      # resource path
      local_var_path = '/users/{projectKey}/{environmentKey}/{userKey}/flags'.sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s).sub('{' + 'userKey' + '}', user_key.to_s)

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
        :return_type => 'UserFlagSettings')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserSettingsApi#get_user_flag_settings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Specifically enable or disable a feature flag for a user based on their key.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param user_key The user&#39;s key.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param user_settings_body 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def put_flag_setting(project_key, environment_key, user_key, feature_flag_key, user_settings_body, opts = {})
      put_flag_setting_with_http_info(project_key, environment_key, user_key, feature_flag_key, user_settings_body, opts)
      nil
    end

    # Specifically enable or disable a feature flag for a user based on their key.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param environment_key The environment key, used to tie together flag configuration and users under one environment so they can be managed together.
    # @param user_key The user&#39;s key.
    # @param feature_flag_key The feature flag&#39;s key. The key identifies the flag in your code.
    # @param user_settings_body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def put_flag_setting_with_http_info(project_key, environment_key, user_key, feature_flag_key, user_settings_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UserSettingsApi.put_flag_setting ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling UserSettingsApi.put_flag_setting"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling UserSettingsApi.put_flag_setting"
      end
      # verify the required parameter 'user_key' is set
      if @api_client.config.client_side_validation && user_key.nil?
        fail ArgumentError, "Missing the required parameter 'user_key' when calling UserSettingsApi.put_flag_setting"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling UserSettingsApi.put_flag_setting"
      end
      # verify the required parameter 'user_settings_body' is set
      if @api_client.config.client_side_validation && user_settings_body.nil?
        fail ArgumentError, "Missing the required parameter 'user_settings_body' when calling UserSettingsApi.put_flag_setting"
      end
      # resource path
      local_var_path = '/users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey}'.sub('{' + 'projectKey' + '}', project_key.to_s).sub('{' + 'environmentKey' + '}', environment_key.to_s).sub('{' + 'userKey' + '}', user_key.to_s).sub('{' + 'featureFlagKey' + '}', feature_flag_key.to_s)

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
      post_body = @api_client.object_to_http_body(user_settings_body)
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserSettingsApi#put_flag_setting\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
