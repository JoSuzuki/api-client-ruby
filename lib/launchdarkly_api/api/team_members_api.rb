=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 5.0.3
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.17

=end

require 'uri'

module LaunchDarklyApi
  class TeamMembersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete a team member by ID.
    # @param member_id The member ID.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_member(member_id, opts = {})
      delete_member_with_http_info(member_id, opts)
      nil
    end

    # Delete a team member by ID.
    # @param member_id The member ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_member_with_http_info(member_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamMembersApi.delete_member ...'
      end
      # verify the required parameter 'member_id' is set
      if @api_client.config.client_side_validation && member_id.nil?
        fail ArgumentError, "Missing the required parameter 'member_id' when calling TeamMembersApi.delete_member"
      end
      # resource path
      local_var_path = '/members/{memberId}'.sub('{' + 'memberId' + '}', member_id.to_s)

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
        @api_client.config.logger.debug "API called: TeamMembersApi#delete_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Get the current team member associated with the token
    # @param [Hash] opts the optional parameters
    # @return [Member]
    def get_me(opts = {})
      data, _status_code, _headers = get_me_with_http_info(opts)
      data
    end

    # Get the current team member associated with the token
    # @param [Hash] opts the optional parameters
    # @return [Array<(Member, Fixnum, Hash)>] Member data, response status code and response headers
    def get_me_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamMembersApi.get_me ...'
      end
      # resource path
      local_var_path = '/members/me'

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
        :return_type => 'Member')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamMembersApi#get_me\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Get a single team member by ID.
    # @param member_id The member ID.
    # @param [Hash] opts the optional parameters
    # @return [Member]
    def get_member(member_id, opts = {})
      data, _status_code, _headers = get_member_with_http_info(member_id, opts)
      data
    end

    # Get a single team member by ID.
    # @param member_id The member ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Member, Fixnum, Hash)>] Member data, response status code and response headers
    def get_member_with_http_info(member_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamMembersApi.get_member ...'
      end
      # verify the required parameter 'member_id' is set
      if @api_client.config.client_side_validation && member_id.nil?
        fail ArgumentError, "Missing the required parameter 'member_id' when calling TeamMembersApi.get_member"
      end
      # resource path
      local_var_path = '/members/{memberId}'.sub('{' + 'memberId' + '}', member_id.to_s)

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
        :return_type => 'Member')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamMembersApi#get_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Returns a list of all members in the account.
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :limit The number of objects to return. Defaults to -1, which returns everything.
    # @option opts [Float] :offset Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items.
    # @option opts [String] :filter A comma-separated list of filters. Each filter is of the form field:value.
    # @option opts [String] :sort A comma-separated list of fields to sort by. A field prefixed by a - will be sorted in descending order.
    # @return [Members]
    def get_members(opts = {})
      data, _status_code, _headers = get_members_with_http_info(opts)
      data
    end

    # Returns a list of all members in the account.
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :limit The number of objects to return. Defaults to -1, which returns everything.
    # @option opts [Float] :offset Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items.
    # @option opts [String] :filter A comma-separated list of filters. Each filter is of the form field:value.
    # @option opts [String] :sort A comma-separated list of fields to sort by. A field prefixed by a - will be sorted in descending order.
    # @return [Array<(Members, Fixnum, Hash)>] Members data, response status code and response headers
    def get_members_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamMembersApi.get_members ...'
      end
      # resource path
      local_var_path = '/members'

      # query parameters
      query_params = {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?

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
        :return_type => 'Members')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamMembersApi#get_members\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Modify a team member by ID.
    # @param member_id The member ID.
    # @param patch_delta Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39;
    # @param [Hash] opts the optional parameters
    # @return [Member]
    def patch_member(member_id, patch_delta, opts = {})
      data, _status_code, _headers = patch_member_with_http_info(member_id, patch_delta, opts)
      data
    end

    # Modify a team member by ID.
    # @param member_id The member ID.
    # @param patch_delta Requires a JSON Patch representation of the desired changes to the project. &#39;http://jsonpatch.com/&#39;
    # @param [Hash] opts the optional parameters
    # @return [Array<(Member, Fixnum, Hash)>] Member data, response status code and response headers
    def patch_member_with_http_info(member_id, patch_delta, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamMembersApi.patch_member ...'
      end
      # verify the required parameter 'member_id' is set
      if @api_client.config.client_side_validation && member_id.nil?
        fail ArgumentError, "Missing the required parameter 'member_id' when calling TeamMembersApi.patch_member"
      end
      # verify the required parameter 'patch_delta' is set
      if @api_client.config.client_side_validation && patch_delta.nil?
        fail ArgumentError, "Missing the required parameter 'patch_delta' when calling TeamMembersApi.patch_member"
      end
      # resource path
      local_var_path = '/members/{memberId}'.sub('{' + 'memberId' + '}', member_id.to_s)

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
        :return_type => 'Member')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamMembersApi#patch_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Invite new members.
    # @param members_body New members to invite.
    # @param [Hash] opts the optional parameters
    # @return [Members]
    def post_members(members_body, opts = {})
      data, _status_code, _headers = post_members_with_http_info(members_body, opts)
      data
    end

    # Invite new members.
    # @param members_body New members to invite.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Members, Fixnum, Hash)>] Members data, response status code and response headers
    def post_members_with_http_info(members_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamMembersApi.post_members ...'
      end
      # verify the required parameter 'members_body' is set
      if @api_client.config.client_side_validation && members_body.nil?
        fail ArgumentError, "Missing the required parameter 'members_body' when calling TeamMembersApi.post_members"
      end
      # resource path
      local_var_path = '/members'

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
      post_body = @api_client.object_to_http_body(members_body)
      auth_names = ['Token']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Members')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamMembersApi#post_members\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
