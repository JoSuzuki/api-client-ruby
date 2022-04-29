=begin
#LaunchDarkly REST API

## Overview  ## Authentication  All REST API resources are authenticated with either [personal or service access tokens](https://docs.launchdarkly.com/home/account-security/api-access-tokens), or session cookies. Other authentication mechanisms are not supported. You can manage personal access tokens on your [Account settings](https://app.launchdarkly.com/settings/tokens) page.  LaunchDarkly also has SDK keys, mobile keys, and client-side IDs that are used by our server-side SDKs, mobile SDKs, and client-side SDKs, respectively. **These keys cannot be used to access our REST API**. These keys are environment-specific, and can only perform read-only operations (fetching feature flag settings).  | Auth mechanism                                                                                  | Allowed resources                                                                                     | Use cases                                          | | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | -------------------------------------------------- | | [Personal access tokens](https://docs.launchdarkly.com/home/account-security/api-access-tokens) | Can be customized on a per-token basis                                                                | Building scripts, custom integrations, data export | | SDK keys                                                                                        | Can only access read-only SDK-specific resources and the firehose, restricted to a single environment | Server-side SDKs, Firehose API                     | | Mobile keys                                                                                     | Can only access read-only mobile SDK-specific resources, restricted to a single environment           | Mobile SDKs                                        | | Client-side ID                                                                                  | Single environment, only flags marked available to client-side                                        | Client-side JavaScript                             |  > #### Keep your access tokens and SDK keys private > > Access tokens should _never_ be exposed in untrusted contexts. Never put an access token in client-side JavaScript, or embed it in a mobile application. LaunchDarkly has special mobile keys that you can embed in mobile apps. If you accidentally expose an access token or SDK key, you can reset it from your [Account Settings](https://app.launchdarkly.com/settings#/tokens) page. > > The client-side ID is safe to embed in untrusted contexts. It's designed for use in client-side JavaScript.  ### Via request header  The preferred way to authenticate with the API is by adding an `Authorization` header containing your access token to your requests. The value of the `Authorization` header must be your access token.  Manage personal access tokens from the [Account Settings](https://app.launchdarkly.com/settings/tokens) page.  ### Via session cookie  For testing purposes, you can make API calls directly from your web browser. If you're logged in to the application, the API will use your existing session to authenticate calls.  If you have a [role](https://docs.launchdarkly.com/home/team/built-in-roles) other than Admin, or have a [custom role](https://docs.launchdarkly.com/home/team/custom-roles) defined, you may not have permission to perform some API calls. You will receive a `401` response code in that case.  > ### Modifying the Origin header causes an error > > LaunchDarkly validates that the Origin header for any API request authenticated by a session cookie matches the expected Origin header. The expected Origin header is `https://app.launchdarkly.com`. > > If the Origin header does not match what's expected, LaunchDarkly returns an error. This error can prevent the LaunchDarkly app from working correctly. > > Any browser extension that intentionally changes the Origin header can cause this problem. For example, the `Allow-Control-Allow-Origin: *` Chrome extension changes the Origin header to `http://evil.com` and causes the app to fail. > > To prevent this error, do not modify your Origin header. > > LaunchDarkly does not require origin matching when authenticating with an access token, so this issue does not affect normal API usage.  ## Representations  All resources expect and return JSON response bodies. Error responses will also send a JSON body. Read [Errors](#section/Errors) for a more detailed description of the error format used by the API.  In practice this means that you always get a response with a `Content-Type` header set to `application/json`.  In addition, request bodies for `PUT`, `POST`, `REPORT` and `PATCH` requests must be encoded as JSON with a `Content-Type` header set to `application/json`.  ### Summary and detailed representations  When you fetch a list of resources, the response includes only the most important attributes of each resource. This is a _summary representation_ of the resource. When you fetch an individual resource, such as a single feature flag, you receive a _detailed representation_ of the resource.  The best way to find a detailed representation is to follow links. Every summary representation includes a link to its detailed representation.  In most cases, the detailed representation contains all of the attributes of the resource. In a few cases, the detailed representation contains many, but not all, of the attributes of the resource. Typically this happens when an attribute of the requested resource is itself paginated. You can request that the response include a particular attribute by using the `expand` request parameter.  ### Links and addressability  The best way to navigate the API is by following links. These are attributes in representations that link to other resources. The API always uses the same format for links:  - Links to other resources within the API are encapsulated in a `_links` object. - If the resource has a corresponding link to HTML content on the site, it is stored in a special `_site` link.  Each link has two attributes: an href (the URL) and a type (the content type). For example, a feature resource might return the following:  ```json {   \"_links\": {     \"parent\": {       \"href\": \"/api/features\",       \"type\": \"application/json\"     },     \"self\": {       \"href\": \"/api/features/sort.order\",       \"type\": \"application/json\"     }   },   \"_site\": {     \"href\": \"/features/sort.order\",     \"type\": \"text/html\"   } } ```  From this, you can navigate to the parent collection of features by following the `parent` link, or navigate to the site page for the feature by following the `_site` link.  Collections are always represented as a JSON object with an `items` attribute containing an array of representations. Like all other representations, collections have `_links` defined at the top level.  Paginated collections include `first`, `last`, `next`, and `prev` links containing a URL with the respective set of elements in the collection.  ### Expanding responses  Sometimes the detailed representation of a resource does not include all of the attributes of the resource by default. If this is the case, the request method will clearly document this and describe which attributes you can include in an expanded response.  To include the additional attributes, append the `expand` request parameter to your request and add a comma-separated list of the attributes to include. For example, when you append `?expand=members,roles` to the [Get team](/tag/Teams-(beta)#operation/getTeam) endpoint, the expanded response includes both of these attributes.  ## Updates  Resources that accept partial updates use the `PATCH` verb, and support the [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902) format. Some resources also support the [JSON Merge Patch](https://datatracker.ietf.org/doc/html/rfc7386) format. In addition, some resources support optional comments that can be submitted with updates. Comments appear in outgoing webhooks, the audit log, and other integrations.  ### Updates via JSON Patch  [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902) is a way to specify the modifications to perform on a resource. For example, in this feature flag representation:  ```json {     \"name\": \"New recommendations engine\",     \"key\": \"engine.enable\",     \"description\": \"This is the description\",     ... } ```  You can change the feature flag's description with the following patch document:  ```json [{ \"op\": \"replace\", \"path\": \"/description\", \"value\": \"This is the new description\" }] ```  JSON Patch documents are always arrays. You can specify multiple modifications to perform in a single request. You can also test that certain preconditions are met before applying the patch:  ```json [   { \"op\": \"test\", \"path\": \"/version\", \"value\": 10 },   { \"op\": \"replace\", \"path\": \"/description\", \"value\": \"The new description\" } ] ```  The above patch request tests whether the feature flag's `version` is `10`, and if so, changes the feature flag's description.  Attributes that aren't editable, like a resource's `_links`, have names that start with an underscore.  ### Updates via JSON Merge Patch  The API also supports the [JSON Merge Patch](https://datatracker.ietf.org/doc/html/rfc7386) format, as well as the [Update feature flag](/tag/Feature-flags#operation/patchFeatureFlag) resource.  JSON Merge Patch is less expressive than JSON Patch but in many cases, it is simpler to construct a merge patch document. For example, you can change a feature flag's description with the following merge patch document:  ```json {   \"description\": \"New flag description\" } ```  ### Updates with comments  You can submit optional comments with `PATCH` changes. The [Update feature flag](/tag/Feature-flags#operation/patchFeatureFlag) resource supports comments.  To submit a comment along with a JSON Patch document, use the following format:  ```json {   \"comment\": \"This is a comment string\",   \"patch\": [{ \"op\": \"replace\", \"path\": \"/description\", \"value\": \"The new description\" }] } ```  To submit a comment along with a JSON Merge Patch document, use the following format:  ```json {   \"comment\": \"This is a comment string\",   \"merge\": { \"description\": \"New flag description\" } } ```  ### Updates via semantic patches  The API also supports the Semantic patch format. A semantic `PATCH` is a way to specify the modifications to perform on a resource as a set of executable instructions.  JSON Patch uses paths and a limited set of operations to describe how to transform the current state of the resource into a new state. Semantic patch allows you to be explicit about intent using precise, custom instructions. In many cases, semantic patch instructions can also be defined independently of the current state of the resource. This can be useful when defining a change that may be applied at a future date.  For example, in this feature flag configuration in environment Production:  ```json {     \"name\": \"Alternate sort order\",     \"kind\": \"boolean\",     \"key\": \"sort.order\",    ...     \"environments\": {         \"production\": {             \"on\": true,             \"archived\": false,             \"salt\": \"c29ydC5vcmRlcg==\",             \"sel\": \"8de1085cb7354b0ab41c0e778376dfd3\",             \"lastModified\": 1469131558260,             \"version\": 81,             \"targets\": [                 {                     \"values\": [                         \"Gerhard.Little@yahoo.com\"                     ],                     \"variation\": 0                 },                 {                     \"values\": [                         \"1461797806429-33-861961230\",                         \"438580d8-02ee-418d-9eec-0085cab2bdf0\"                     ],                     \"variation\": 1                 }             ],             \"rules\": [],             \"fallthrough\": {                 \"variation\": 0             },             \"offVariation\": 1,             \"prerequisites\": [],             \"_site\": {                 \"href\": \"/default/production/features/sort.order\",                 \"type\": \"text/html\"             }        }     } } ```  You can add a date you want a user to be removed from the feature flag's user targets. For example, “remove user 1461797806429-33-861961230 from the user target for variation 0 on the Alternate sort order flag in the production environment on Wed Jul 08 2020 at 15:27:41 pm”. This is done using the following:  ```json {   \"comment\": \"update expiring user targets\",   \"instructions\": [     {       \"kind\": \"removeExpireUserTargetDate\",       \"userKey\": \"userKey\",       \"variationId\": \"978d53f9-7fe3-4a63-992d-97bcb4535dc8\"     },     {       \"kind\": \"updateExpireUserTargetDate\",       \"userKey\": \"userKey2\",       \"variationId\": \"978d53f9-7fe3-4a63-992d-97bcb4535dc8\",       \"value\": 1587582000000     },     {       \"kind\": \"addExpireUserTargetDate\",       \"userKey\": \"userKey3\",       \"variationId\": \"978d53f9-7fe3-4a63-992d-97bcb4535dc8\",       \"value\": 1594247266386     }   ] } ```  Here is another example. In this feature flag configuration:  ```json {   \"name\": \"New recommendations engine\",   \"key\": \"engine.enable\",   \"environments\": {     \"test\": {       \"on\": true     }   } } ```  You can change the feature flag's description with the following patch document as a set of executable instructions. For example, “add user X to targets for variation Y and remove user A from targets for variation B for test flag”:  ```json {   \"comment\": \"\",   \"instructions\": [     {       \"kind\": \"removeUserTargets\",       \"values\": [\"438580d8-02ee-418d-9eec-0085cab2bdf0\"],       \"variationId\": \"852cb784-54ff-46b9-8c35-5498d2e4f270\"     },     {       \"kind\": \"addUserTargets\",       \"values\": [\"438580d8-02ee-418d-9eec-0085cab2bdf0\"],       \"variationId\": \"1bb18465-33b6-49aa-a3bd-eeb6650b33ad\"     }   ] } ```  > ### Supported semantic patch API endpoints > > - [Update feature flag](/tag/Feature-flags#operation/patchFeatureFlag) > - [Update expiring user targets on feature flag](/tag/Feature-flags#operation/patchExpiringUserTargets) > - [Update expiring user target for flags](/tag/User-settings#operation/patchExpiringFlagsForUser) > - [Update expiring user targets on segment](/tag/Segments#operation/patchExpiringUserTargetsForSegment)  ## Errors  The API always returns errors in a common format. Here's an example:  ```json {   \"code\": \"invalid_request\",   \"message\": \"A feature with that key already exists\",   \"id\": \"30ce6058-87da-11e4-b116-123b93f75cba\" } ```  The general class of error is indicated by the `code`. The `message` is a human-readable explanation of what went wrong. The `id` is a unique identifier. Use it when you're working with LaunchDarkly support to debug a problem with a specific API call.  ### HTTP Status - Error Response Codes  | Code | Definition        | Desc.                                                                                       | Possible Solution                                                | | ---- | ----------------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- | | 400  | Bad Request       | A request that fails may return this HTTP response code.                                    | Ensure JSON syntax in request body is correct.                   | | 401  | Unauthorized      | User doesn't have permission to an API call.                                                | Ensure your SDK key is good.                                     | | 403  | Forbidden         | User does not have permission for operation.                                                | Ensure that the user or access token has proper permissions set. | | 409  | Conflict          | The API request could not be completed because it conflicted with a concurrent API request. | Retry your request.                                              | | 429  | Too many requests | See [Rate limiting](/#section/Rate-limiting).                                               | Wait and try again later.                                        |  ## CORS  The LaunchDarkly API supports Cross Origin Resource Sharing (CORS) for AJAX requests from any origin. If an `Origin` header is given in a request, it will be echoed as an explicitly allowed origin. Otherwise, a wildcard is returned: `Access-Control-Allow-Origin: *`. For more information on CORS, see the [CORS W3C Recommendation](http://www.w3.org/TR/cors). Example CORS headers might look like:  ```http Access-Control-Allow-Headers: Accept, Content-Type, Content-Length, Accept-Encoding, Authorization Access-Control-Allow-Methods: OPTIONS, GET, DELETE, PATCH Access-Control-Allow-Origin: * Access-Control-Max-Age: 300 ```  You can make authenticated CORS calls just as you would make same-origin calls, using either [token or session-based authentication](#section/Authentication). If you’re using session auth, you should set the `withCredentials` property for your `xhr` request to `true`. You should never expose your access tokens to untrusted users.  ## Rate limiting  We use several rate limiting strategies to ensure the availability of our APIs. Rate-limited calls to our APIs will return a `429` status code. Calls to our APIs will include headers indicating the current rate limit status. The specific headers returned depend on the API route being called. The limits differ based on the route, authentication mechanism, and other factors. Routes that are not rate limited may not contain any of the headers described below.  > ### Rate limiting and SDKs > > LaunchDarkly SDKs are never rate limited and do not use the API endpoints defined here. LaunchDarkly uses a different set of approaches, including streaming/server-sent events and a global CDN, to ensure availability to the routes used by LaunchDarkly SDKs. > > The client-side ID is safe to embed in untrusted contexts. It's designed for use in client-side JavaScript.  ### Global rate limits  Authenticated requests are subject to a global limit. This is the maximum number of calls that can be made to the API per ten seconds. All personal access tokens on the account share this limit, so exceeding the limit with one access token will impact other tokens. Calls that are subject to global rate limits will return the headers below:  | Header name                    | Description                                                                      | | ------------------------------ | -------------------------------------------------------------------------------- | | `X-Ratelimit-Global-Remaining` | The maximum number of requests the account is permitted to make per ten seconds. | | `X-Ratelimit-Reset`            | The time at which the current rate limit window resets in epoch milliseconds.    |  We do not publicly document the specific number of calls that can be made globally. This limit may change, and we encourage clients to program against the specification, relying on the two headers defined above, rather than hardcoding to the current limit.  ### Route-level rate limits  Some authenticated routes have custom rate limits. These also reset every ten seconds. Any access tokens hitting the same route share this limit, so exceeding the limit with one access token may impact other tokens. Calls that are subject to route-level rate limits will return the headers below:  | Header name                   | Description                                                                                           | | ----------------------------- | ----------------------------------------------------------------------------------------------------- | | `X-Ratelimit-Route-Remaining` | The maximum number of requests to the current route the account is permitted to make per ten seconds. | | `X-Ratelimit-Reset`           | The time at which the current rate limit window resets in epoch milliseconds.                         |  A _route_ represents a specific URL pattern and verb. For example, the [Delete environment](/tag/Environments#operation/deleteEnvironment) endpoint is considered a single route, and each call to delete an environment counts against your route-level rate limit for that route.  We do not publicly document the specific number of calls that can be made to each endpoint per ten seconds. These limits may change, and we encourage clients to program against the specification, relying on the two headers defined above, rather than hardcoding to the current limits.  ### IP-based rate limiting  We also employ IP-based rate limiting on some API routes. If you hit an IP-based rate limit, your API response will include a `Retry-After` header indicating how long to wait before re-trying the call. Clients must wait at least `Retry-After` seconds before making additional calls to our API, and should employ jitter and backoff strategies to avoid triggering rate limits again.  ## OpenAPI (Swagger)  We have a [complete OpenAPI (Swagger) specification](https://app.launchdarkly.com/api/v2/openapi.json) for our API.  You can use this specification to generate client libraries to interact with our REST API in your language of choice.  This specification is supported by several API-based tools such as Postman and Insomnia. In many cases, you can directly import our specification to ease use in navigating the APIs in the tooling.  ## Client libraries  We auto-generate multiple client libraries based on our OpenAPI specification. To learn more, visit [GitHub](https://github.com/search?q=topic%3Alaunchdarkly-api+org%3Alaunchdarkly&type=Repositories).  ## Method Overriding  Some firewalls and HTTP clients restrict the use of verbs other than `GET` and `POST`. In those environments, our API endpoints that use `PUT`, `PATCH`, and `DELETE` verbs will be inaccessible.  To avoid this issue, our API supports the `X-HTTP-Method-Override` header, allowing clients to \"tunnel\" `PUT`, `PATCH`, and `DELETE` requests via a `POST` request.  For example, if you wish to call one of our `PATCH` resources via a `POST` request, you can include `X-HTTP-Method-Override:PATCH` as a header.  ## Beta resources  We sometimes release new API resources in **beta** status before we release them with general availability.  Resources that are in beta are still undergoing testing and development. They may change without notice, including becoming backwards incompatible.  We try to promote resources into general availability as quickly as possible. This happens after sufficient testing and when we're satisfied that we no longer need to make backwards-incompatible changes.  We mark beta resources with a \"Beta\" callout in our documentation, pictured below:  > ### This feature is in beta > > To use this feature, pass in a header including the `LD-API-Version` key with value set to `beta`. Use this header with each call. To learn more, read [Beta resources](/#section/Overview/Beta-resources).  ### Using beta resources  To use a beta resource, you must include a header in the request. If you call a beta resource without this header, you'll receive a `403` response.  Use this header:  ``` LD-API-Version: beta ```  ## Versioning  We try hard to keep our REST API backwards compatible, but we occasionally have to make backwards-incompatible changes in the process of shipping new features. These breaking changes can cause unexpected behavior if you don't prepare for them accordingly.  Updates to our REST API include support for the latest features in LaunchDarkly. We also release a new version of our REST API every time we make a breaking change. We provide simultaneous support for multiple API versions so you can migrate from your current API version to a new version at your own pace.  ### Setting the API version per request  You can set the API version on a specific request by sending an `LD-API-Version` header, as shown in the example below:  ``` LD-API-Version: 20210729 ```  The header value is the version number of the API version you'd like to request. The number for each version corresponds to the date the version was released in yyyymmdd format. In the example above the version `20210729` corresponds to July 29, 2021.  ### Setting the API version per access token  When creating an access token, you must specify a specific version of the API to use. This ensures that integrations using this token cannot be broken by version changes.  Tokens created before versioning was released have their version set to `20160426` (the version of the API that existed before versioning) so that they continue working the same way they did before versioning.  If you would like to upgrade your integration to use a new API version, you can explicitly set the header described above.  > ### Best practice: Set the header for every client or integration > > We recommend that you set the API version header explicitly in any client or integration you build. > > Only rely on the access token API version during manual testing.  ### API version changelog  | Version | Changes | |---|---| | `20210729` | <ul><li>Changed the [create approval request](/tag/Approvals#operation/postApprovalRequest) return value. It now returns HTTP Status Code `201` instead of `200`.</li><li> Changed the [get users](/tag/Users#operation/getUser) return value. It now returns a user record, not a user. </li><li> Added additional optional fields to environment, segments, flags, members, and segments, including the ability to create Big Segments. </li><li> Added default values for flag variations when new environments are created. </li><li> Added filtering and pagination for getting flags and members, including `limit`, `number`, `filter`, and `sort` query parameters. </li><li> Added endpoints for expiring user targets for flags and segments, scheduled changes, access tokens, Relay Proxy configuration, integrations and subscriptions, and approvals. </li></ul> | | `20191212` | <ul><li>[List feature flags](/tag/Feature-flags#operation/getFeatureFlags) now defaults to sending summaries of feature flag configurations, equivalent to setting the query parameter `summary=true`. Summaries omit flag targeting rules and individual user targets from the payload. </li><li> Added endpoints for flags, flag status, projects, environments, users, audit logs, members, users, custom roles, segments, usage, streams, events, and data export. </li></ul> | | `20160426` | <ul><li>Initial versioning of API. Tokens created before versioning have their version set to this.</li></ul> | 

The version of the OpenAPI document: 2.0
Contact: support@launchdarkly.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.0

=end

require 'cgi'

module LaunchDarklyApi
  class TeamsBetaApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete team
    # Delete a team by key. To learn more, read [Deleting a team](https://docs.launchdarkly.com/home/teams/managing#deleting-a-team).
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_team(team_key, opts = {})
      delete_team_with_http_info(team_key, opts)
      nil
    end

    # Delete team
    # Delete a team by key. To learn more, read [Deleting a team](https://docs.launchdarkly.com/home/teams/managing#deleting-a-team).
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_team_with_http_info(team_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamsBetaApi.delete_team ...'
      end
      # verify the required parameter 'team_key' is set
      if @api_client.config.client_side_validation && team_key.nil?
        fail ArgumentError, "Missing the required parameter 'team_key' when calling TeamsBetaApi.delete_team"
      end
      # resource path
      local_var_path = '/api/v2/teams/{teamKey}'.sub('{' + 'teamKey' + '}', CGI.escape(team_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"TeamsBetaApi.delete_team",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamsBetaApi#delete_team\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get team
    # Fetch a team by key
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @return [Team]
    def get_team(team_key, opts = {})
      data, _status_code, _headers = get_team_with_http_info(team_key, opts)
      data
    end

    # Get team
    # Fetch a team by key
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @return [Array<(Team, Integer, Hash)>] Team data, response status code and response headers
    def get_team_with_http_info(team_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamsBetaApi.get_team ...'
      end
      # verify the required parameter 'team_key' is set
      if @api_client.config.client_side_validation && team_key.nil?
        fail ArgumentError, "Missing the required parameter 'team_key' when calling TeamsBetaApi.get_team"
      end
      # resource path
      local_var_path = '/api/v2/teams/{teamKey}'.sub('{' + 'teamKey' + '}', CGI.escape(team_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Team'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"TeamsBetaApi.get_team",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamsBetaApi#get_team\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get team maintainers
    # Fetch the maintainers that have been assigned to the team. To learn more, read [Managing team maintainers](https://docs.launchdarkly.com/home/teams/managing#managing-team-maintainers).
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The number of maintainers to return in the response. Defaults to 20.
    # @option opts [Integer] :offset Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first ten items and then return the next &#x60;limit&#x60; items.
    # @return [TeamMaintainers]
    def get_team_maintainers(team_key, opts = {})
      data, _status_code, _headers = get_team_maintainers_with_http_info(team_key, opts)
      data
    end

    # Get team maintainers
    # Fetch the maintainers that have been assigned to the team. To learn more, read [Managing team maintainers](https://docs.launchdarkly.com/home/teams/managing#managing-team-maintainers).
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The number of maintainers to return in the response. Defaults to 20.
    # @option opts [Integer] :offset Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first ten items and then return the next &#x60;limit&#x60; items.
    # @return [Array<(TeamMaintainers, Integer, Hash)>] TeamMaintainers data, response status code and response headers
    def get_team_maintainers_with_http_info(team_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamsBetaApi.get_team_maintainers ...'
      end
      # verify the required parameter 'team_key' is set
      if @api_client.config.client_side_validation && team_key.nil?
        fail ArgumentError, "Missing the required parameter 'team_key' when calling TeamsBetaApi.get_team_maintainers"
      end
      # resource path
      local_var_path = '/api/v2/teams/{teamKey}/maintainers'.sub('{' + 'teamKey' + '}', CGI.escape(team_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TeamMaintainers'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"TeamsBetaApi.get_team_maintainers",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamsBetaApi#get_team_maintainers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get team custom roles
    # Fetch the custom roles that have been assigned to the team. To learn more, read [Managing team permissions](https://docs.launchdarkly.com/home/teams/managing#managing-team-permissions).
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The number of roles to return in the response. Defaults to 20.
    # @option opts [Integer] :offset Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first ten items and then return the next &#x60;limit&#x60; items.
    # @return [TeamCustomRoles]
    def get_team_roles(team_key, opts = {})
      data, _status_code, _headers = get_team_roles_with_http_info(team_key, opts)
      data
    end

    # Get team custom roles
    # Fetch the custom roles that have been assigned to the team. To learn more, read [Managing team permissions](https://docs.launchdarkly.com/home/teams/managing#managing-team-permissions).
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The number of roles to return in the response. Defaults to 20.
    # @option opts [Integer] :offset Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first ten items and then return the next &#x60;limit&#x60; items.
    # @return [Array<(TeamCustomRoles, Integer, Hash)>] TeamCustomRoles data, response status code and response headers
    def get_team_roles_with_http_info(team_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamsBetaApi.get_team_roles ...'
      end
      # verify the required parameter 'team_key' is set
      if @api_client.config.client_side_validation && team_key.nil?
        fail ArgumentError, "Missing the required parameter 'team_key' when calling TeamsBetaApi.get_team_roles"
      end
      # resource path
      local_var_path = '/api/v2/teams/{teamKey}/roles'.sub('{' + 'teamKey' + '}', CGI.escape(team_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TeamCustomRoles'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"TeamsBetaApi.get_team_roles",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamsBetaApi#get_team_roles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List teams
    # Return a list of teams.  By default, this returns the first 20 teams. Page through this list with the `limit` parameter and by following the `first`, `prev`, `next`, and `last` links in the returned `_links` field. These links are not present if the pages they refer to don't exist. For example, the `first` and `prev` links will be missing from the response on the first page.  ### Filtering teams  LaunchDarkly supports the `query` field for filtering. `query` is a string that matches against the teams' names and keys. It is not case sensitive. For example, the filter `query:abc` matches teams with the string `abc` in their name or key. 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The number of teams to return in the response. Defaults to 20.
    # @option opts [Integer] :offset Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first ten items and then return the next &#x60;limit&#x60; items.
    # @option opts [String] :filter A comma-separated list of filters. Each filter is of the form &#x60;field:value&#x60;. Supported fields are explained above.
    # @return [Teams]
    def get_teams(opts = {})
      data, _status_code, _headers = get_teams_with_http_info(opts)
      data
    end

    # List teams
    # Return a list of teams.  By default, this returns the first 20 teams. Page through this list with the &#x60;limit&#x60; parameter and by following the &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, and &#x60;last&#x60; links in the returned &#x60;_links&#x60; field. These links are not present if the pages they refer to don&#39;t exist. For example, the &#x60;first&#x60; and &#x60;prev&#x60; links will be missing from the response on the first page.  ### Filtering teams  LaunchDarkly supports the &#x60;query&#x60; field for filtering. &#x60;query&#x60; is a string that matches against the teams&#39; names and keys. It is not case sensitive. For example, the filter &#x60;query:abc&#x60; matches teams with the string &#x60;abc&#x60; in their name or key. 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The number of teams to return in the response. Defaults to 20.
    # @option opts [Integer] :offset Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first ten items and then return the next &#x60;limit&#x60; items.
    # @option opts [String] :filter A comma-separated list of filters. Each filter is of the form &#x60;field:value&#x60;. Supported fields are explained above.
    # @return [Array<(Teams, Integer, Hash)>] Teams data, response status code and response headers
    def get_teams_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamsBetaApi.get_teams ...'
      end
      # resource path
      local_var_path = '/api/v2/teams'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Teams'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"TeamsBetaApi.get_teams",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamsBetaApi#get_teams\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update team
    # Perform a partial update to a team.  The body of a semantic patch request takes the following three properties:  1. comment `string`: (Optional) A description of the update. 1. instructions `array`: (Required) The action or list of actions to be performed by the update. Each update action in the list must be an object/hash table with a `kind` property, although depending on the action, other properties may be necessary. Read below for more information on the specific supported semantic patch instructions.  If any instruction in the patch encounters an error, the error will be returned and the flag will not be changed. In general, instructions will silently do nothing if the flag is already in the state requested by the patch instruction. They will generally error if a parameter refers to something that does not exist. Other specific error conditions are noted in the instruction descriptions.  ### Instructions  #### `addCustomRoles`  Adds custom roles to the team. Team members will have these custom roles granted to them.  ##### Parameters  - `values`: list of custom role keys  #### `removeCustomRoles`  Removes the custom roles on the team. Team members will no longer have these custom roles granted to them.  ##### Parameters  - `values`: list of custom role keys  #### `addMembers`  Adds members to the team.  ##### Parameters  - `values`: list of member IDs  #### `removeMembers`  Removes members from the team.  ##### Parameters  - `values`: list of member IDs  #### `addPermissionGrants`  Adds permission grants to members for the team, allowing them to, for example, act as a team maintainer. A permission grant may have either an `actionSet` or a list of `actions` but not both at the same time. The members do not have to be team members to have a permission grant for the team.  ##### Parameters  - `actionSet`: name of the action set - `actions`: list of actions - `memberIDs`: list of member IDs  #### `removePermissionGrants`  Removes permission grants from members for the team. The `actionSet` and `actions` must match an existing permission grant.  ##### Parameters  - `actionSet`: name of the action set - `actions`: list of actions - `memberIDs`: list of member IDs  #### `updateDescription`  Updates the team's description.  ##### Parameters  - `value`: the team's new description  #### `updateName`  Updates the team's name.  ##### Parameters  - `value`: the team's new name 
    # @param team_key [String] The team key
    # @param team_patch_input [TeamPatchInput] 
    # @param [Hash] opts the optional parameters
    # @return [Team]
    def patch_team(team_key, team_patch_input, opts = {})
      data, _status_code, _headers = patch_team_with_http_info(team_key, team_patch_input, opts)
      data
    end

    # Update team
    # Perform a partial update to a team.  The body of a semantic patch request takes the following three properties:  1. comment &#x60;string&#x60;: (Optional) A description of the update. 1. instructions &#x60;array&#x60;: (Required) The action or list of actions to be performed by the update. Each update action in the list must be an object/hash table with a &#x60;kind&#x60; property, although depending on the action, other properties may be necessary. Read below for more information on the specific supported semantic patch instructions.  If any instruction in the patch encounters an error, the error will be returned and the flag will not be changed. In general, instructions will silently do nothing if the flag is already in the state requested by the patch instruction. They will generally error if a parameter refers to something that does not exist. Other specific error conditions are noted in the instruction descriptions.  ### Instructions  #### &#x60;addCustomRoles&#x60;  Adds custom roles to the team. Team members will have these custom roles granted to them.  ##### Parameters  - &#x60;values&#x60;: list of custom role keys  #### &#x60;removeCustomRoles&#x60;  Removes the custom roles on the team. Team members will no longer have these custom roles granted to them.  ##### Parameters  - &#x60;values&#x60;: list of custom role keys  #### &#x60;addMembers&#x60;  Adds members to the team.  ##### Parameters  - &#x60;values&#x60;: list of member IDs  #### &#x60;removeMembers&#x60;  Removes members from the team.  ##### Parameters  - &#x60;values&#x60;: list of member IDs  #### &#x60;addPermissionGrants&#x60;  Adds permission grants to members for the team, allowing them to, for example, act as a team maintainer. A permission grant may have either an &#x60;actionSet&#x60; or a list of &#x60;actions&#x60; but not both at the same time. The members do not have to be team members to have a permission grant for the team.  ##### Parameters  - &#x60;actionSet&#x60;: name of the action set - &#x60;actions&#x60;: list of actions - &#x60;memberIDs&#x60;: list of member IDs  #### &#x60;removePermissionGrants&#x60;  Removes permission grants from members for the team. The &#x60;actionSet&#x60; and &#x60;actions&#x60; must match an existing permission grant.  ##### Parameters  - &#x60;actionSet&#x60;: name of the action set - &#x60;actions&#x60;: list of actions - &#x60;memberIDs&#x60;: list of member IDs  #### &#x60;updateDescription&#x60;  Updates the team&#39;s description.  ##### Parameters  - &#x60;value&#x60;: the team&#39;s new description  #### &#x60;updateName&#x60;  Updates the team&#39;s name.  ##### Parameters  - &#x60;value&#x60;: the team&#39;s new name 
    # @param team_key [String] The team key
    # @param team_patch_input [TeamPatchInput] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Team, Integer, Hash)>] Team data, response status code and response headers
    def patch_team_with_http_info(team_key, team_patch_input, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamsBetaApi.patch_team ...'
      end
      # verify the required parameter 'team_key' is set
      if @api_client.config.client_side_validation && team_key.nil?
        fail ArgumentError, "Missing the required parameter 'team_key' when calling TeamsBetaApi.patch_team"
      end
      # verify the required parameter 'team_patch_input' is set
      if @api_client.config.client_side_validation && team_patch_input.nil?
        fail ArgumentError, "Missing the required parameter 'team_patch_input' when calling TeamsBetaApi.patch_team"
      end
      # resource path
      local_var_path = '/api/v2/teams/{teamKey}'.sub('{' + 'teamKey' + '}', CGI.escape(team_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(team_patch_input)

      # return_type
      return_type = opts[:debug_return_type] || 'Team'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"TeamsBetaApi.patch_team",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamsBetaApi#patch_team\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create team
    # Create a team. To learn more, read [Creating a team](https://docs.launchdarkly.com/home/teams/creating).
    # @param team_post_input [TeamPostInput] 
    # @param [Hash] opts the optional parameters
    # @return [Team]
    def post_team(team_post_input, opts = {})
      data, _status_code, _headers = post_team_with_http_info(team_post_input, opts)
      data
    end

    # Create team
    # Create a team. To learn more, read [Creating a team](https://docs.launchdarkly.com/home/teams/creating).
    # @param team_post_input [TeamPostInput] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Team, Integer, Hash)>] Team data, response status code and response headers
    def post_team_with_http_info(team_post_input, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamsBetaApi.post_team ...'
      end
      # verify the required parameter 'team_post_input' is set
      if @api_client.config.client_side_validation && team_post_input.nil?
        fail ArgumentError, "Missing the required parameter 'team_post_input' when calling TeamsBetaApi.post_team"
      end
      # resource path
      local_var_path = '/api/v2/teams'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(team_post_input)

      # return_type
      return_type = opts[:debug_return_type] || 'Team'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"TeamsBetaApi.post_team",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamsBetaApi#post_team\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Add multiple members to team
    # Add multiple members to an existing team by uploading a CSV file of member email addresses. Your CSV file must include email addresses in the first column. You can include data in additional columns, but LaunchDarkly ignores all data outside the first column. Headers are optional. To learn more, read [Managing team members](https://docs.launchdarkly.com/home/teams/managing#managing-team-members).  **Members are only added on a `201` response.** A `207` indicates the CSV file contains a combination of valid and invalid entries and will _not_ result in any members being added to the team.  On a `207` response, if an entry contains bad user input the `message` field will contain the row number as well as the reason for the error. The `message` field will be omitted if the entry is valid.  Example `207` response: ```json {   \"items\": [     {       \"status\": \"success\",       \"value\": \"a-valid-email@launchdarkly.com\"     },     {       \"message\": \"Line 2: empty row\",       \"status\": \"error\",       \"value\": \"\"     },     {       \"message\": \"Line 3: email already exists in the specified team\",       \"status\": \"error\",       \"value\": \"existing-team-member@launchdarkly.com\"     },     {       \"message\": \"Line 4: invalid email formatting\",       \"status\": \"error\",       \"value\": \"invalid email format\"     }   ] } ```  Message | Resolution --- | --- Empty row | This line is blank. Add an email address and try again. Duplicate entry | This email address appears in the file twice. Remove the email from the file and try again. Email already exists in the specified team | This member is already on your team. Remove the email from the file and try again. Invalid formatting | This email address is not formatted correctly. Fix the formatting and try again. Email does not belong to a LaunchDarkly member | The email address doesn't belong to a LaunchDarkly account member. Invite them to LaunchDarkly, then re-add them to the team.  On a `400` response, the `message` field may contain errors specific to this endpoint.  Example `400` response: ```json {   \"code\": \"invalid_request\",   \"message\": \"Unable to process file\" } ```  Message | Resolution --- | --- Unable to process file | LaunchDarkly could not process the file for an unspecified reason. Review your file for errors and try again. File exceeds 25mb | Break up your file into multiple files of less than 25mbs each. All emails have invalid formatting | None of the email addresses in the file are in the correct format. Fix the formatting and try again. All emails belong to existing team members | All listed members are already on this team. Populate the file with member emails that do not belong to the team and try again. File is empty | The CSV file does not contain any email addresses. Populate the file and try again. No emails belong to members of your LaunchDarkly organization | None of the email addresses belong to members of your LaunchDarkly account. Invite these members to LaunchDarkly, then re-add them to the team. 
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @option opts [File] :file CSV file containing email addresses
    # @return [TeamImportsRep]
    def post_team_members(team_key, opts = {})
      data, _status_code, _headers = post_team_members_with_http_info(team_key, opts)
      data
    end

    # Add multiple members to team
    # Add multiple members to an existing team by uploading a CSV file of member email addresses. Your CSV file must include email addresses in the first column. You can include data in additional columns, but LaunchDarkly ignores all data outside the first column. Headers are optional. To learn more, read [Managing team members](https://docs.launchdarkly.com/home/teams/managing#managing-team-members).  **Members are only added on a &#x60;201&#x60; response.** A &#x60;207&#x60; indicates the CSV file contains a combination of valid and invalid entries and will _not_ result in any members being added to the team.  On a &#x60;207&#x60; response, if an entry contains bad user input the &#x60;message&#x60; field will contain the row number as well as the reason for the error. The &#x60;message&#x60; field will be omitted if the entry is valid.  Example &#x60;207&#x60; response: &#x60;&#x60;&#x60;json {   \&quot;items\&quot;: [     {       \&quot;status\&quot;: \&quot;success\&quot;,       \&quot;value\&quot;: \&quot;a-valid-email@launchdarkly.com\&quot;     },     {       \&quot;message\&quot;: \&quot;Line 2: empty row\&quot;,       \&quot;status\&quot;: \&quot;error\&quot;,       \&quot;value\&quot;: \&quot;\&quot;     },     {       \&quot;message\&quot;: \&quot;Line 3: email already exists in the specified team\&quot;,       \&quot;status\&quot;: \&quot;error\&quot;,       \&quot;value\&quot;: \&quot;existing-team-member@launchdarkly.com\&quot;     },     {       \&quot;message\&quot;: \&quot;Line 4: invalid email formatting\&quot;,       \&quot;status\&quot;: \&quot;error\&quot;,       \&quot;value\&quot;: \&quot;invalid email format\&quot;     }   ] } &#x60;&#x60;&#x60;  Message | Resolution --- | --- Empty row | This line is blank. Add an email address and try again. Duplicate entry | This email address appears in the file twice. Remove the email from the file and try again. Email already exists in the specified team | This member is already on your team. Remove the email from the file and try again. Invalid formatting | This email address is not formatted correctly. Fix the formatting and try again. Email does not belong to a LaunchDarkly member | The email address doesn&#39;t belong to a LaunchDarkly account member. Invite them to LaunchDarkly, then re-add them to the team.  On a &#x60;400&#x60; response, the &#x60;message&#x60; field may contain errors specific to this endpoint.  Example &#x60;400&#x60; response: &#x60;&#x60;&#x60;json {   \&quot;code\&quot;: \&quot;invalid_request\&quot;,   \&quot;message\&quot;: \&quot;Unable to process file\&quot; } &#x60;&#x60;&#x60;  Message | Resolution --- | --- Unable to process file | LaunchDarkly could not process the file for an unspecified reason. Review your file for errors and try again. File exceeds 25mb | Break up your file into multiple files of less than 25mbs each. All emails have invalid formatting | None of the email addresses in the file are in the correct format. Fix the formatting and try again. All emails belong to existing team members | All listed members are already on this team. Populate the file with member emails that do not belong to the team and try again. File is empty | The CSV file does not contain any email addresses. Populate the file and try again. No emails belong to members of your LaunchDarkly organization | None of the email addresses belong to members of your LaunchDarkly account. Invite these members to LaunchDarkly, then re-add them to the team. 
    # @param team_key [String] The team key
    # @param [Hash] opts the optional parameters
    # @option opts [File] :file CSV file containing email addresses
    # @return [Array<(TeamImportsRep, Integer, Hash)>] TeamImportsRep data, response status code and response headers
    def post_team_members_with_http_info(team_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamsBetaApi.post_team_members ...'
      end
      # verify the required parameter 'team_key' is set
      if @api_client.config.client_side_validation && team_key.nil?
        fail ArgumentError, "Missing the required parameter 'team_key' when calling TeamsBetaApi.post_team_members"
      end
      # resource path
      local_var_path = '/api/v2/teams/{teamKey}/members'.sub('{' + 'teamKey' + '}', CGI.escape(team_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['file'] = opts[:'file'] if !opts[:'file'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TeamImportsRep'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"TeamsBetaApi.post_team_members",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamsBetaApi#post_team_members\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
