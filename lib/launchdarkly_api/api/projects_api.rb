=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 3.0.0
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.8

=end

require 'uri'

module LaunchDarklyApi
  class ProjectsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_project(project_key, opts = {})
      delete_project_with_http_info(project_key, opts)
      nil
    end

    # Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_project_with_http_info(project_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProjectsApi.delete_project ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling ProjectsApi.delete_project"
      end
      # resource path
      local_var_path = '/projects/{projectKey}'.sub('{' + 'projectKey' + '}', project_key.to_s)

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
        @api_client.config.logger.debug "API called: ProjectsApi#delete_project\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Fetch a single project by key.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param [Hash] opts the optional parameters
    # @return [Project]
    def get_project(project_key, opts = {})
      data, _status_code, _headers = get_project_with_http_info(project_key, opts)
      data
    end

    # Fetch a single project by key.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Project, Fixnum, Hash)>] Project data, response status code and response headers
    def get_project_with_http_info(project_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProjectsApi.get_project ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling ProjectsApi.get_project"
      end
      # resource path
      local_var_path = '/projects/{projectKey}'.sub('{' + 'projectKey' + '}', project_key.to_s)

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
        :return_type => 'Project')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectsApi#get_project\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Returns a list of all projects in the account.
    # @param [Hash] opts the optional parameters
    # @return [Projects]
    def get_projects(opts = {})
      data, _status_code, _headers = get_projects_with_http_info(opts)
      data
    end

    # Returns a list of all projects in the account.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Projects, Fixnum, Hash)>] Projects data, response status code and response headers
    def get_projects_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProjectsApi.get_projects ...'
      end
      # resource path
      local_var_path = '/projects'

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
        :return_type => 'Projects')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectsApi#get_projects\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Modify a project by ID.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param patch_delta Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39;
    # @param [Hash] opts the optional parameters
    # @return [Project]
    def patch_project(project_key, patch_delta, opts = {})
      data, _status_code, _headers = patch_project_with_http_info(project_key, patch_delta, opts)
      data
    end

    # Modify a project by ID.
    # @param project_key The project key, used to tie the flags together under one project so they can be managed together.
    # @param patch_delta Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39;
    # @param [Hash] opts the optional parameters
    # @return [Array<(Project, Fixnum, Hash)>] Project data, response status code and response headers
    def patch_project_with_http_info(project_key, patch_delta, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProjectsApi.patch_project ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling ProjectsApi.patch_project"
      end
      # verify the required parameter 'patch_delta' is set
      if @api_client.config.client_side_validation && patch_delta.nil?
        fail ArgumentError, "Missing the required parameter 'patch_delta' when calling ProjectsApi.patch_project"
      end
      # resource path
      local_var_path = '/projects/{projectKey}'.sub('{' + 'projectKey' + '}', project_key.to_s)

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
      post_body = @api_client.object_to_http_body(patch_delta)
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Project')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectsApi#patch_project\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create a new project with the given key and name.
    # @param project_body Project keys must be unique within an account.
    # @param [Hash] opts the optional parameters
    # @return [Project]
    def post_project(project_body, opts = {})
      data, _status_code, _headers = post_project_with_http_info(project_body, opts)
      data
    end

    # Create a new project with the given key and name.
    # @param project_body Project keys must be unique within an account.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Project, Fixnum, Hash)>] Project data, response status code and response headers
    def post_project_with_http_info(project_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProjectsApi.post_project ...'
      end
      # verify the required parameter 'project_body' is set
      if @api_client.config.client_side_validation && project_body.nil?
        fail ArgumentError, "Missing the required parameter 'project_body' when calling ProjectsApi.post_project"
      end
      # resource path
      local_var_path = '/projects'

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
      post_body = @api_client.object_to_http_body(project_body)
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Project')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProjectsApi#post_project\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
