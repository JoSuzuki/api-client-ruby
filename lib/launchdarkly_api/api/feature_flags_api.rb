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
  class FeatureFlagsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Copy feature flag
    # The includedActions and excludedActions define the parts of the flag configuration that are copied or not copied. By default, the entire flag configuration is copied.  You can have either `includedActions` or `excludedActions` but not both.  Valid `includedActions` and `excludedActions` include:  - `updateOn` - `updatePrerequisites` - `updateTargets` - `updateRules` - `updateFallthrough` - `updateOffVariation`    The `source` and `target` must be JSON objects if using curl, specifying the environment key and (optional) current flag configuration version in that environment. For example:  ```json {   \"key\": \"production\",   \"currentVersion\": 3 } ```  If target is specified as above, the API will test to ensure that the current flag version in the `production` environment is `3`, and reject attempts to copy settings to `production` otherwise. You can use this to enforce optimistic locking on copy attempts. 
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key. The key identifies the flag in your code.
    # @param flag_copy_config_post [FlagCopyConfigPost] 
    # @param [Hash] opts the optional parameters
    # @return [FeatureFlag]
    def copy_feature_flag(project_key, feature_flag_key, flag_copy_config_post, opts = {})
      data, _status_code, _headers = copy_feature_flag_with_http_info(project_key, feature_flag_key, flag_copy_config_post, opts)
      data
    end

    # Copy feature flag
    # The includedActions and excludedActions define the parts of the flag configuration that are copied or not copied. By default, the entire flag configuration is copied.  You can have either &#x60;includedActions&#x60; or &#x60;excludedActions&#x60; but not both.  Valid &#x60;includedActions&#x60; and &#x60;excludedActions&#x60; include:  - &#x60;updateOn&#x60; - &#x60;updatePrerequisites&#x60; - &#x60;updateTargets&#x60; - &#x60;updateRules&#x60; - &#x60;updateFallthrough&#x60; - &#x60;updateOffVariation&#x60;    The &#x60;source&#x60; and &#x60;target&#x60; must be JSON objects if using curl, specifying the environment key and (optional) current flag configuration version in that environment. For example:  &#x60;&#x60;&#x60;json {   \&quot;key\&quot;: \&quot;production\&quot;,   \&quot;currentVersion\&quot;: 3 } &#x60;&#x60;&#x60;  If target is specified as above, the API will test to ensure that the current flag version in the &#x60;production&#x60; environment is &#x60;3&#x60;, and reject attempts to copy settings to &#x60;production&#x60; otherwise. You can use this to enforce optimistic locking on copy attempts. 
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key. The key identifies the flag in your code.
    # @param flag_copy_config_post [FlagCopyConfigPost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(FeatureFlag, Integer, Hash)>] FeatureFlag data, response status code and response headers
    def copy_feature_flag_with_http_info(project_key, feature_flag_key, flag_copy_config_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.copy_feature_flag ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.copy_feature_flag"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.copy_feature_flag"
      end
      # verify the required parameter 'flag_copy_config_post' is set
      if @api_client.config.client_side_validation && flag_copy_config_post.nil?
        fail ArgumentError, "Missing the required parameter 'flag_copy_config_post' when calling FeatureFlagsApi.copy_feature_flag"
      end
      # resource path
      local_var_path = '/api/v2/flags/{projectKey}/{featureFlagKey}/copy'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'featureFlagKey' + '}', CGI.escape(feature_flag_key.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(flag_copy_config_post)

      # return_type
      return_type = opts[:debug_return_type] || 'FeatureFlag'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.copy_feature_flag",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#copy_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete feature flag
    # Delete a feature flag in all environments. Use with caution: only delete feature flags your application no longer uses.
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_feature_flag(project_key, feature_flag_key, opts = {})
      delete_feature_flag_with_http_info(project_key, feature_flag_key, opts)
      nil
    end

    # Delete feature flag
    # Delete a feature flag in all environments. Use with caution: only delete feature flags your application no longer uses.
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key. The key identifies the flag in your code.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_feature_flag_with_http_info(project_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.delete_feature_flag ...'
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
      local_var_path = '/api/v2/flags/{projectKey}/{featureFlagKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'featureFlagKey' + '}', CGI.escape(feature_flag_key.to_s))

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
        :operation => :"FeatureFlagsApi.delete_feature_flag",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#delete_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get expiring user targets for feature flag
    # Get a list of user targets on a feature flag that are scheduled for removal.
    # @param project_key [String] The project key
    # @param environment_key [String] The environment key
    # @param feature_flag_key [String] The feature flag key
    # @param [Hash] opts the optional parameters
    # @return [ExpiringUserTargetGetResponse]
    def get_expiring_user_targets(project_key, environment_key, feature_flag_key, opts = {})
      data, _status_code, _headers = get_expiring_user_targets_with_http_info(project_key, environment_key, feature_flag_key, opts)
      data
    end

    # Get expiring user targets for feature flag
    # Get a list of user targets on a feature flag that are scheduled for removal.
    # @param project_key [String] The project key
    # @param environment_key [String] The environment key
    # @param feature_flag_key [String] The feature flag key
    # @param [Hash] opts the optional parameters
    # @return [Array<(ExpiringUserTargetGetResponse, Integer, Hash)>] ExpiringUserTargetGetResponse data, response status code and response headers
    def get_expiring_user_targets_with_http_info(project_key, environment_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.get_expiring_user_targets ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.get_expiring_user_targets"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling FeatureFlagsApi.get_expiring_user_targets"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.get_expiring_user_targets"
      end
      # resource path
      local_var_path = '/api/v2/flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'environmentKey' + '}', CGI.escape(environment_key.to_s)).sub('{' + 'featureFlagKey' + '}', CGI.escape(feature_flag_key.to_s))

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
      return_type = opts[:debug_return_type] || 'ExpiringUserTargetGetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.get_expiring_user_targets",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_expiring_user_targets\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get feature flag
    # Get a single feature flag by key. By default, this returns the configurations for all environments. You can filter environments with the `env` query parameter. For example, setting `env=production` restricts the returned configurations to just the `production` environment.
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env Filter configurations by environment
    # @return [FeatureFlag]
    def get_feature_flag(project_key, feature_flag_key, opts = {})
      data, _status_code, _headers = get_feature_flag_with_http_info(project_key, feature_flag_key, opts)
      data
    end

    # Get feature flag
    # Get a single feature flag by key. By default, this returns the configurations for all environments. You can filter environments with the &#x60;env&#x60; query parameter. For example, setting &#x60;env&#x3D;production&#x60; restricts the returned configurations to just the &#x60;production&#x60; environment.
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env Filter configurations by environment
    # @return [Array<(FeatureFlag, Integer, Hash)>] FeatureFlag data, response status code and response headers
    def get_feature_flag_with_http_info(project_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.get_feature_flag ...'
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
      local_var_path = '/api/v2/flags/{projectKey}/{featureFlagKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'featureFlagKey' + '}', CGI.escape(feature_flag_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'env'] = opts[:'env'] if !opts[:'env'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'FeatureFlag'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.get_feature_flag",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get feature flag status
    # Get the status for a particular feature flag.
    # @param project_key [String] The project key
    # @param environment_key [String] The environment key
    # @param feature_flag_key [String] The feature flag key
    # @param [Hash] opts the optional parameters
    # @return [FlagStatusRep]
    def get_feature_flag_status(project_key, environment_key, feature_flag_key, opts = {})
      data, _status_code, _headers = get_feature_flag_status_with_http_info(project_key, environment_key, feature_flag_key, opts)
      data
    end

    # Get feature flag status
    # Get the status for a particular feature flag.
    # @param project_key [String] The project key
    # @param environment_key [String] The environment key
    # @param feature_flag_key [String] The feature flag key
    # @param [Hash] opts the optional parameters
    # @return [Array<(FlagStatusRep, Integer, Hash)>] FlagStatusRep data, response status code and response headers
    def get_feature_flag_status_with_http_info(project_key, environment_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.get_feature_flag_status ...'
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
      local_var_path = '/api/v2/flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'environmentKey' + '}', CGI.escape(environment_key.to_s)).sub('{' + 'featureFlagKey' + '}', CGI.escape(feature_flag_key.to_s))

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
      return_type = opts[:debug_return_type] || 'FlagStatusRep'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.get_feature_flag_status",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flag_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get flag status across environments
    # Get the status for a particular feature flag across environments.
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env Optional environment filter
    # @return [FeatureFlagStatusAcrossEnvironments]
    def get_feature_flag_status_across_environments(project_key, feature_flag_key, opts = {})
      data, _status_code, _headers = get_feature_flag_status_across_environments_with_http_info(project_key, feature_flag_key, opts)
      data
    end

    # Get flag status across environments
    # Get the status for a particular feature flag across environments.
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env Optional environment filter
    # @return [Array<(FeatureFlagStatusAcrossEnvironments, Integer, Hash)>] FeatureFlagStatusAcrossEnvironments data, response status code and response headers
    def get_feature_flag_status_across_environments_with_http_info(project_key, feature_flag_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.get_feature_flag_status_across_environments ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.get_feature_flag_status_across_environments"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.get_feature_flag_status_across_environments"
      end
      # resource path
      local_var_path = '/api/v2/flag-status/{projectKey}/{featureFlagKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'featureFlagKey' + '}', CGI.escape(feature_flag_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'env'] = opts[:'env'] if !opts[:'env'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'FeatureFlagStatusAcrossEnvironments'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.get_feature_flag_status_across_environments",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flag_status_across_environments\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List feature flag statuses
    # Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as a state, which is one of the following:  - `new`: the feature flag was created within the last seven days, and has not been requested yet - `active`: the feature flag was requested by your servers or clients within the last seven days - `inactive`: the feature flag was created more than seven days ago, and hasn't been requested by your servers or clients within the past seven days - `launched`: one variation of the feature flag has been rolled out to all your users for at least 7 days 
    # @param project_key [String] The project key
    # @param environment_key [String] The environment key
    # @param [Hash] opts the optional parameters
    # @return [FeatureFlagStatuses]
    def get_feature_flag_statuses(project_key, environment_key, opts = {})
      data, _status_code, _headers = get_feature_flag_statuses_with_http_info(project_key, environment_key, opts)
      data
    end

    # List feature flag statuses
    # Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as a state, which is one of the following:  - &#x60;new&#x60;: the feature flag was created within the last seven days, and has not been requested yet - &#x60;active&#x60;: the feature flag was requested by your servers or clients within the last seven days - &#x60;inactive&#x60;: the feature flag was created more than seven days ago, and hasn&#39;t been requested by your servers or clients within the past seven days - &#x60;launched&#x60;: one variation of the feature flag has been rolled out to all your users for at least 7 days 
    # @param project_key [String] The project key
    # @param environment_key [String] The environment key
    # @param [Hash] opts the optional parameters
    # @return [Array<(FeatureFlagStatuses, Integer, Hash)>] FeatureFlagStatuses data, response status code and response headers
    def get_feature_flag_statuses_with_http_info(project_key, environment_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.get_feature_flag_statuses ...'
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
      local_var_path = '/api/v2/flag-statuses/{projectKey}/{environmentKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'environmentKey' + '}', CGI.escape(environment_key.to_s))

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
      return_type = opts[:debug_return_type] || 'FeatureFlagStatuses'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.get_feature_flag_statuses",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flag_statuses\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List feature flags
    # Get a list of all features in the given project. By default, each feature includes configurations for each environment. You can filter environments with the env query parameter. For example, setting `env=production` restricts the returned configurations to just your production environment. You can also filter feature flags by tag with the tag query parameter.  We support the following fields for filters:  - `query` is a string that matches against the flags' keys and names. It is not case sensitive. - `archived` is a boolean to filter the list to archived flags. When this is absent, only unarchived flags are returned. - `type` is a string allowing filtering to `temporary` or `permanent` flags. - `status` is a string allowing filtering to `new`, `inactive`, `active`, or `launched` flags in the specified environment. This filter also requires a `filterEnv` field to be set to a valid environment. For example: `filter=status:active,filterEnv:production`. - `tags` is a + separated list of tags. It filters the list to members who have all of the tags in the list. - `hasExperiment` is a boolean with values of true or false and returns any flags that have an attached metric. - `hasDataExport` is a boolean with values of true or false and returns any flags that are currently exporting data in the specified environment. This includes flags that are exporting data via Experimentation. This filter also requires a `filterEnv` field to be set to a valid environment key. e.g. `filter=hasExperiment:true,filterEnv:production` - `evaluated` is an object that contains a key of `after` and a value in Unix time in milliseconds. This returns all flags that have been evaluated since the time you specify in the environment provided. This filter also requires a `filterEnv` field to be set to a valid environment. For example: `filter=evaluated:{\"after\": 1590768455282},filterEnv:production`. - `filterEnv` is a string with the key of a valid environment. The filterEnv field is used for filters that are environment specific. If there are multiple environment specific filters you should only declare this parameter once. For example: `filter=evaluated:{\"after\": 1590768455282},filterEnv:production,status:active`.  An example filter is `query:abc,tags:foo+bar`. This matches flags with the string `abc` in their key or name, ignoring case, which also have the tags `foo` and `bar`.  By default, this returns all flags. You can page through the list with the `limit` parameter and by following the `first`, `prev`, `next`, and `last` links in the returned `_links` field. These links will not be present if the pages they refer to don't exist. For example, the `first` and `prev` links will be missing from the response on the first page. 
    # @param project_key [String] The project key
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env Filter configurations by environment
    # @option opts [String] :tag Filter feature flags by tag
    # @option opts [Integer] :limit The number of feature flags to return. Defaults to -1, which returns all flags
    # @option opts [Integer] :offset Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and then returns the next limit items
    # @option opts [Boolean] :archived A boolean to filter the list to archived flags. When this is absent, only unarchived flags will be returned
    # @option opts [Boolean] :summary By default in API version &gt;&#x3D; 1, flags will _not_ include their list of prerequisites, targets or rules.  Set summary&#x3D;0 to include these fields for each flag returned
    # @option opts [String] :filter A comma-separated list of filters. Each filter is of the form field:value
    # @option opts [String] :sort A comma-separated list of fields to sort by. Fields prefixed by a dash ( - ) sort in descending order
    # @option opts [Boolean] :compare A boolean to filter results by only flags that have differences between environments
    # @return [FeatureFlags]
    def get_feature_flags(project_key, opts = {})
      data, _status_code, _headers = get_feature_flags_with_http_info(project_key, opts)
      data
    end

    # List feature flags
    # Get a list of all features in the given project. By default, each feature includes configurations for each environment. You can filter environments with the env query parameter. For example, setting &#x60;env&#x3D;production&#x60; restricts the returned configurations to just your production environment. You can also filter feature flags by tag with the tag query parameter.  We support the following fields for filters:  - &#x60;query&#x60; is a string that matches against the flags&#39; keys and names. It is not case sensitive. - &#x60;archived&#x60; is a boolean to filter the list to archived flags. When this is absent, only unarchived flags are returned. - &#x60;type&#x60; is a string allowing filtering to &#x60;temporary&#x60; or &#x60;permanent&#x60; flags. - &#x60;status&#x60; is a string allowing filtering to &#x60;new&#x60;, &#x60;inactive&#x60;, &#x60;active&#x60;, or &#x60;launched&#x60; flags in the specified environment. This filter also requires a &#x60;filterEnv&#x60; field to be set to a valid environment. For example: &#x60;filter&#x3D;status:active,filterEnv:production&#x60;. - &#x60;tags&#x60; is a + separated list of tags. It filters the list to members who have all of the tags in the list. - &#x60;hasExperiment&#x60; is a boolean with values of true or false and returns any flags that have an attached metric. - &#x60;hasDataExport&#x60; is a boolean with values of true or false and returns any flags that are currently exporting data in the specified environment. This includes flags that are exporting data via Experimentation. This filter also requires a &#x60;filterEnv&#x60; field to be set to a valid environment key. e.g. &#x60;filter&#x3D;hasExperiment:true,filterEnv:production&#x60; - &#x60;evaluated&#x60; is an object that contains a key of &#x60;after&#x60; and a value in Unix time in milliseconds. This returns all flags that have been evaluated since the time you specify in the environment provided. This filter also requires a &#x60;filterEnv&#x60; field to be set to a valid environment. For example: &#x60;filter&#x3D;evaluated:{\&quot;after\&quot;: 1590768455282},filterEnv:production&#x60;. - &#x60;filterEnv&#x60; is a string with the key of a valid environment. The filterEnv field is used for filters that are environment specific. If there are multiple environment specific filters you should only declare this parameter once. For example: &#x60;filter&#x3D;evaluated:{\&quot;after\&quot;: 1590768455282},filterEnv:production,status:active&#x60;.  An example filter is &#x60;query:abc,tags:foo+bar&#x60;. This matches flags with the string &#x60;abc&#x60; in their key or name, ignoring case, which also have the tags &#x60;foo&#x60; and &#x60;bar&#x60;.  By default, this returns all flags. You can page through the list with the &#x60;limit&#x60; parameter and by following the &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, and &#x60;last&#x60; links in the returned &#x60;_links&#x60; field. These links will not be present if the pages they refer to don&#39;t exist. For example, the &#x60;first&#x60; and &#x60;prev&#x60; links will be missing from the response on the first page. 
    # @param project_key [String] The project key
    # @param [Hash] opts the optional parameters
    # @option opts [String] :env Filter configurations by environment
    # @option opts [String] :tag Filter feature flags by tag
    # @option opts [Integer] :limit The number of feature flags to return. Defaults to -1, which returns all flags
    # @option opts [Integer] :offset Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and then returns the next limit items
    # @option opts [Boolean] :archived A boolean to filter the list to archived flags. When this is absent, only unarchived flags will be returned
    # @option opts [Boolean] :summary By default in API version &gt;&#x3D; 1, flags will _not_ include their list of prerequisites, targets or rules.  Set summary&#x3D;0 to include these fields for each flag returned
    # @option opts [String] :filter A comma-separated list of filters. Each filter is of the form field:value
    # @option opts [String] :sort A comma-separated list of fields to sort by. Fields prefixed by a dash ( - ) sort in descending order
    # @option opts [Boolean] :compare A boolean to filter results by only flags that have differences between environments
    # @return [Array<(FeatureFlags, Integer, Hash)>] FeatureFlags data, response status code and response headers
    def get_feature_flags_with_http_info(project_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.get_feature_flags ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.get_feature_flags"
      end
      # resource path
      local_var_path = '/api/v2/flags/{projectKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'env'] = opts[:'env'] if !opts[:'env'].nil?
      query_params[:'tag'] = opts[:'tag'] if !opts[:'tag'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'archived'] = opts[:'archived'] if !opts[:'archived'].nil?
      query_params[:'summary'] = opts[:'summary'] if !opts[:'summary'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?
      query_params[:'compare'] = opts[:'compare'] if !opts[:'compare'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'FeatureFlags'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.get_feature_flags",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#get_feature_flags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update expiring user targets on feature flag
    # Update the list of user targets on a feature flag that are scheduled for removal.
    # @param project_key [String] The project key
    # @param environment_key [String] The environment key
    # @param feature_flag_key [String] The feature flag key
    # @param patch_with_comment [PatchWithComment] 
    # @param [Hash] opts the optional parameters
    # @return [ExpiringUserTargetPatchResponse]
    def patch_expiring_user_targets(project_key, environment_key, feature_flag_key, patch_with_comment, opts = {})
      data, _status_code, _headers = patch_expiring_user_targets_with_http_info(project_key, environment_key, feature_flag_key, patch_with_comment, opts)
      data
    end

    # Update expiring user targets on feature flag
    # Update the list of user targets on a feature flag that are scheduled for removal.
    # @param project_key [String] The project key
    # @param environment_key [String] The environment key
    # @param feature_flag_key [String] The feature flag key
    # @param patch_with_comment [PatchWithComment] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ExpiringUserTargetPatchResponse, Integer, Hash)>] ExpiringUserTargetPatchResponse data, response status code and response headers
    def patch_expiring_user_targets_with_http_info(project_key, environment_key, feature_flag_key, patch_with_comment, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.patch_expiring_user_targets ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.patch_expiring_user_targets"
      end
      # verify the required parameter 'environment_key' is set
      if @api_client.config.client_side_validation && environment_key.nil?
        fail ArgumentError, "Missing the required parameter 'environment_key' when calling FeatureFlagsApi.patch_expiring_user_targets"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.patch_expiring_user_targets"
      end
      # verify the required parameter 'patch_with_comment' is set
      if @api_client.config.client_side_validation && patch_with_comment.nil?
        fail ArgumentError, "Missing the required parameter 'patch_with_comment' when calling FeatureFlagsApi.patch_expiring_user_targets"
      end
      # resource path
      local_var_path = '/api/v2/flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'environmentKey' + '}', CGI.escape(environment_key.to_s)).sub('{' + 'featureFlagKey' + '}', CGI.escape(feature_flag_key.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(patch_with_comment)

      # return_type
      return_type = opts[:debug_return_type] || 'ExpiringUserTargetPatchResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.patch_expiring_user_targets",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#patch_expiring_user_targets\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update feature flag
    # Perform a partial update to a feature flag.  ## Using semantic patches on a feature flag  To use a [semantic patch](/reference#updates-via-semantic-patches) on a feature flag resource, you must include a header in the request. If you call a semantic patch resource without this header, you will receive a `400` response because your semantic patch will be interpreted as a JSON patch.  Use this header:  ``` Content-Type: application/json; domain-model=launchdarkly.semanticpatch ```  The body of a semantic patch request takes the following three properties:  1. `comment` (string): (Optional) A description of the update. 1. `environmentKey` (string): (Required) The key of the LaunchDarkly environment. 1. `instructions` (array): (Required) The list of actions to be performed by the update. Each action in the list must be an object/hash table with a `kind` property that indicates the instruction. Depending on the `kind`, the API may require other parameters. When this is the case, add the parameters as additional fields to the instruction object. Read below for more information on the specific supported semantic patch instructions.  If any instruction in the patch encounters an error, the error will be returned and the flag will not be changed. In general, instructions will silently do nothing if the flag is already in the state requested by the patch instruction. For example, `removeUserTargets` does nothing when the targets have already been removed. They will generally error if a parameter refers to something that does not exist, like a variation ID that doesn't correspond to a variation on the flag or a rule ID that doesn't belong to a rule on the flag. Other specific error conditions are noted in the instruction descriptions.  ### Instructions  #### `turnFlagOn`  Sets the flag's targeting state to on.  For example, to flip a flag on, use this request body:  ```json {   \"environmentKey\": \"example-environment-key\",   \"instructions\": [ { \"kind\": \"turnFlagOn\" } ] } ```  #### `turnFlagOff`  Sets the flag's targeting state to off.  For example, to flip a flag off, use this request body:  ```json {   \"environmentKey\": \"example-environment-key\",   \"instructions\": [ { \"kind\": \"turnFlagOff\" } ] } ```  #### `addUserTargets`  Adds the user keys in `values` to the individual user targets for the variation specified by `variationId`. Returns an error if this causes the same user key to be targeted in multiple variations.  ##### Parameters  - `values`: list of user keys - `variationId`: ID of a variation on the flag  #### `removeUserTargets`  Removes the user keys in `values` to the individual user targets for the variation specified by `variationId`. Does nothing if the user keys are not targeted.  ##### Parameters  - `values`: list of user keys - `variationId`: ID of a variation on the flag  #### `replaceUserTargets`  Completely replaces the existing set of user targeting. All variations must be provided. Example:  ```json {   \"kind\": \"replaceUserTargets\",   \"targets\": [     {       \"variationId\": \"variation-1\",       \"values\": [\"blah\", \"foo\", \"bar\"]     },     {       \"variationId\": \"variation-2\",       \"values\": [\"abc\", \"def\"]     }   ] } ```  ##### Parameters  - `targets`: a list of user targeting  #### `clearUserTargets`  Removes all individual user targets from the variation specified by `variationId`  ##### Parameters  - `variationId`: ID of a variation on the flag  #### `addPrerequisite`  Adds the flag indicated by `key` with variation `variationId` as a prerequisite to the flag.  ##### Parameters  - `key`: flag key of another flag - `variationId`: ID of a variation of the flag with key `key`  #### `removePrerequisite`  Removes the prerequisite indicated by `key`. Does nothing if this prerequisite does not exist.  ##### Parameters  - `key`: flag key of an existing prerequisite  #### `updatePrerequisite`  Changes the prerequisite with flag key `key` to the variation indicated by `variationId`. Returns an error if this prerequisite does not exist.  ##### Parameters  - `key`: flag key of an existing prerequisite - `variationId`: ID of a variation of the flag with key `key`  #### `replacePrerequisites`  Completely replaces the existing set of prerequisites for a given flag. Example:  ```json {   \"kind\": \"replacePrerequisites\",   \"prerequisites\": [     {       \"key\": \"flag-key\",       \"variationId\": \"variation-1\"     },     {       \"key\": \"another-flag\",       \"variationId\": \"variation-2\"     }   ] } ```  ##### Parameters  - `prerequisites`: a list of prerequisites  #### `addRule`  Adds a new rule to the flag with the given `clauses` which serves the variation indicated by `variationId` or the percent rollout indicated by `rolloutWeights` and `rolloutBucketBy`. If `beforeRuleId` is set, the rule will be added in the list of rules before the indicated rule. Otherwise, the rule will be added to the end of the list.  ##### Parameters  - `clauses`: Array of clauses (see `addClauses`) - `beforeRuleId`: Optional ID of a rule in the flag - `variationId`: ID of a variation of the flag - `rolloutWeights`: Map of variationId to weight in thousandths of a percent (0-100000) - `rolloutBucketBy`: Optional user attribute  #### `removeRule`  Removes the targeting rule specified by `ruleId`. Does nothing if the rule does not exist.  ##### Parameters  - `ruleId`: ID of a rule in the flag  #### `replaceRules`  Completely replaces the existing rules for a given flag. Example:  ```json {   \"kind\": \"replaceRules\",   \"rules\": [     {       \"variationId\": \"variation-1\",       \"description\": \"myRule\",       \"clauses\": [         {           \"attribute\": \"segmentMatch\",           \"op\": \"segmentMatch\",           \"values\": [\"test\"]         }       ],       \"trackEvents\": true     }   ] } ```  ##### Parameters  - `rules`: a list of rules  #### `addClauses`  Adds the given clauses to the rule indicated by `ruleId`.  ##### Parameters  - `ruleId`: ID of a rule in the flag - `clauses`: Array of clause objects, with `attribute` (string), `op` (string), and `values` (array of strings, numbers, or dates) properties.  #### `removeClauses`  Removes the clauses specified by `clauseIds` from the rule indicated by `ruleId`.  #### Parameters  - `ruleId`: ID of a rule in the flag - `clauseIds`: Array of IDs of clauses in the rule  #### `updateClause`  Replaces the clause indicated by `ruleId` and `clauseId` with `clause`.  ##### Parameters  - `ruleId`: ID of a rule in the flag - `clauseId`: ID of a clause in that rule - `clause`: Clause object  #### `addValuesToClause`  Adds `values` to the values of the clause indicated by `ruleId` and `clauseId`.  ##### Parameters  - `ruleId`: ID of a rule in the flag - `clauseId`: ID of a clause in that rule - `values`: Array of strings  #### `removeValuesFromClause`  Removes `values` from the values of the clause indicated by `ruleId` and `clauseId`.  ##### Parameters  `ruleId`: ID of a rule in the flag `clauseId`: ID of a clause in that rule `values`: Array of strings  #### `reorderRules`  Rearranges the rules to match the order given in `ruleIds`. Will return an error if `ruleIds` does not match the current set of rules on the flag.  ##### Parameters  - `ruleIds`: Array of IDs of all rules in the flag  #### `updateRuleVariationOrRollout`  Updates what the rule indicated by `ruleId` serves if its clauses evaluate to true. Can either be a fixed variation indicated by `variationId` or a percent rollout indicated by `rolloutWeights` and `rolloutBucketBy`.  ##### Parameters  - `ruleId`: ID of a rule in the flag - `variationId`: ID of a variation of the flag   or - `rolloutWeights`: Map of variationId to weight in thousandths of a percent (0-100000) - `rolloutBucketBy`: Optional user attribute  #### `updateFallthroughVariationOrRollout`  Updates the flag's fallthrough, which is served if none of the targeting rules match. Can either be a fixed variation indicated by `variationId` or a percent rollout indicated by `rolloutWeights` and `rolloutBucketBy`.  ##### Parameters  `variationId`: ID of a variation of the flag or `rolloutWeights`: Map of variationId to weight in thousandths of a percent (0-100000) `rolloutBucketBy`: Optional user attribute  #### `updateOffVariation`  Updates the variation served when the flag's targeting is off to the variation indicated by `variationId`.  ##### Parameters  `variationId`: ID of a variation of the flag  ### Example  ```json {   \"environmentKey\": \"production\",   \"instructions\": [     {       \"kind\": \"turnFlagOn\"     },     {       \"kind\": \"turnFlagOff\"     },     {       \"kind\": \"addUserTargets\",       \"variationId\": \"8bfb304e-d516-47e5-8727-e7f798e8992d\",       \"values\": [\"userId\", \"userId2\"]     },     {       \"kind\": \"removeUserTargets\",       \"variationId\": \"8bfb304e-d516-47e5-8727-e7f798e8992d\",       \"values\": [\"userId3\", \"userId4\"]     },     {       \"kind\": \"updateFallthroughVariationOrRollout\",       \"rolloutWeights\": {         \"variationId\": 50000,         \"variationId2\": 50000       },       \"rolloutBucketBy\": null     },     {       \"kind\": \"addRule\",       \"clauses\": [         {           \"attribute\": \"segmentMatch\",           \"negate\": false,           \"values\": [\"test-segment\"]         }       ],       \"variationId\": null,       \"rolloutWeights\": {         \"variationId\": 50000,         \"variationId2\": 50000       },       \"rolloutBucketBy\": \"key\"     },     {       \"kind\": \"removeRule\",       \"ruleId\": \"99f12464-a429-40fc-86cc-b27612188955\"     },     {       \"kind\": \"reorderRules\",       \"ruleIds\": [\"2f72974e-de68-4243-8dd3-739582147a1f\", \"8bfb304e-d516-47e5-8727-e7f798e8992d\"]     },     {       \"kind\": \"addClauses\",       \"ruleId\": \"1134\",       \"clauses\": [         {           \"attribute\": \"email\",           \"op\": \"in\",           \"negate\": false,           \"values\": [\"test@test.com\"]         }       ]     },     {       \"kind\": \"removeClauses\",       \"ruleId\": \"1242529\",       \"clauseIds\": [\"8bfb304e-d516-47e5-8727-e7f798e8992d\"]     },     {       \"kind\": \"updateClause\",       \"ruleId\": \"2f72974e-de68-4243-8dd3-739582147a1f\",       \"clauseId\": \"309845\",       \"clause\": {         \"attribute\": \"segmentMatch\",         \"negate\": false,         \"values\": [\"test-segment\"]       }     },     {       \"kind\": \"updateRuleVariationOrRollout\",       \"ruleId\": \"2342\",       \"rolloutWeights\": null,       \"rolloutBucketBy\": null     },     {       \"kind\": \"updateOffVariation\",       \"variationId\": \"3242453\"     },     {       \"kind\": \"addPrerequisite\",       \"variationId\": \"234235\",       \"key\": \"flagKey2\"     },     {       \"kind\": \"updatePrerequisite\",       \"variationId\": \"234235\",       \"key\": \"flagKey2\"     },     {       \"kind\": \"removePrerequisite\",       \"key\": \"flagKey\"     }   ] } ```  ## Using JSON Patches on a feature flag If you do not include the header described above, you can use [JSON patch](/reference#updates-via-json-patch).  When using the update feature flag endpoint to add individual users to a specific variation, there are two different patch documents, depending on whether users are already being individually targeted for the variation.  If a flag variation already has users individually targeted, the path for the JSON Patch operation is:  ```json {   \"op\": \"add\",   \"path\": \"/environments/devint/targets/0/values/-\",   \"value\": \"TestClient10\" } ```  If a flag variation does not already have users individually targeted, the path for the JSON Patch operation is:  ```json [   {     \"op\": \"add\",     \"path\": \"/environments/devint/targets/-\",     \"value\": { \"variation\": 0, \"values\": [\"TestClient10\"] }   } ] ```   ## Required approvals If a request attempts to alter a flag configuration in an environment where approvals are required for the flag, the request will fail with a 405. Changes to the flag configuration in that environment will required creating an [approval request](/tag/Approvals) or a [workflow](/tag/Workflows-(beta)). This behavior can be bypassed by users and access tokens that have a [custom role](https://docs.launchdarkly.com/home/members/custom-roles) with permission to perform the `bypassRequiredApproval` action on the flag.  ## Conflicts If a flag configuration change made through this endpoint would cause a pending scheduled change or approval request to fail, this endpoint will return a 400. You can ignore this check by adding an `ignoreConflicts` query parameter set to `true`. 
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key. The key identifies the flag in your code.
    # @param patch_with_comment [PatchWithComment] 
    # @param [Hash] opts the optional parameters
    # @return [FeatureFlag]
    def patch_feature_flag(project_key, feature_flag_key, patch_with_comment, opts = {})
      data, _status_code, _headers = patch_feature_flag_with_http_info(project_key, feature_flag_key, patch_with_comment, opts)
      data
    end

    # Update feature flag
    # Perform a partial update to a feature flag.  ## Using semantic patches on a feature flag  To use a [semantic patch](/reference#updates-via-semantic-patches) on a feature flag resource, you must include a header in the request. If you call a semantic patch resource without this header, you will receive a &#x60;400&#x60; response because your semantic patch will be interpreted as a JSON patch.  Use this header:  &#x60;&#x60;&#x60; Content-Type: application/json; domain-model&#x3D;launchdarkly.semanticpatch &#x60;&#x60;&#x60;  The body of a semantic patch request takes the following three properties:  1. &#x60;comment&#x60; (string): (Optional) A description of the update. 1. &#x60;environmentKey&#x60; (string): (Required) The key of the LaunchDarkly environment. 1. &#x60;instructions&#x60; (array): (Required) The list of actions to be performed by the update. Each action in the list must be an object/hash table with a &#x60;kind&#x60; property that indicates the instruction. Depending on the &#x60;kind&#x60;, the API may require other parameters. When this is the case, add the parameters as additional fields to the instruction object. Read below for more information on the specific supported semantic patch instructions.  If any instruction in the patch encounters an error, the error will be returned and the flag will not be changed. In general, instructions will silently do nothing if the flag is already in the state requested by the patch instruction. For example, &#x60;removeUserTargets&#x60; does nothing when the targets have already been removed. They will generally error if a parameter refers to something that does not exist, like a variation ID that doesn&#39;t correspond to a variation on the flag or a rule ID that doesn&#39;t belong to a rule on the flag. Other specific error conditions are noted in the instruction descriptions.  ### Instructions  #### &#x60;turnFlagOn&#x60;  Sets the flag&#39;s targeting state to on.  For example, to flip a flag on, use this request body:  &#x60;&#x60;&#x60;json {   \&quot;environmentKey\&quot;: \&quot;example-environment-key\&quot;,   \&quot;instructions\&quot;: [ { \&quot;kind\&quot;: \&quot;turnFlagOn\&quot; } ] } &#x60;&#x60;&#x60;  #### &#x60;turnFlagOff&#x60;  Sets the flag&#39;s targeting state to off.  For example, to flip a flag off, use this request body:  &#x60;&#x60;&#x60;json {   \&quot;environmentKey\&quot;: \&quot;example-environment-key\&quot;,   \&quot;instructions\&quot;: [ { \&quot;kind\&quot;: \&quot;turnFlagOff\&quot; } ] } &#x60;&#x60;&#x60;  #### &#x60;addUserTargets&#x60;  Adds the user keys in &#x60;values&#x60; to the individual user targets for the variation specified by &#x60;variationId&#x60;. Returns an error if this causes the same user key to be targeted in multiple variations.  ##### Parameters  - &#x60;values&#x60;: list of user keys - &#x60;variationId&#x60;: ID of a variation on the flag  #### &#x60;removeUserTargets&#x60;  Removes the user keys in &#x60;values&#x60; to the individual user targets for the variation specified by &#x60;variationId&#x60;. Does nothing if the user keys are not targeted.  ##### Parameters  - &#x60;values&#x60;: list of user keys - &#x60;variationId&#x60;: ID of a variation on the flag  #### &#x60;replaceUserTargets&#x60;  Completely replaces the existing set of user targeting. All variations must be provided. Example:  &#x60;&#x60;&#x60;json {   \&quot;kind\&quot;: \&quot;replaceUserTargets\&quot;,   \&quot;targets\&quot;: [     {       \&quot;variationId\&quot;: \&quot;variation-1\&quot;,       \&quot;values\&quot;: [\&quot;blah\&quot;, \&quot;foo\&quot;, \&quot;bar\&quot;]     },     {       \&quot;variationId\&quot;: \&quot;variation-2\&quot;,       \&quot;values\&quot;: [\&quot;abc\&quot;, \&quot;def\&quot;]     }   ] } &#x60;&#x60;&#x60;  ##### Parameters  - &#x60;targets&#x60;: a list of user targeting  #### &#x60;clearUserTargets&#x60;  Removes all individual user targets from the variation specified by &#x60;variationId&#x60;  ##### Parameters  - &#x60;variationId&#x60;: ID of a variation on the flag  #### &#x60;addPrerequisite&#x60;  Adds the flag indicated by &#x60;key&#x60; with variation &#x60;variationId&#x60; as a prerequisite to the flag.  ##### Parameters  - &#x60;key&#x60;: flag key of another flag - &#x60;variationId&#x60;: ID of a variation of the flag with key &#x60;key&#x60;  #### &#x60;removePrerequisite&#x60;  Removes the prerequisite indicated by &#x60;key&#x60;. Does nothing if this prerequisite does not exist.  ##### Parameters  - &#x60;key&#x60;: flag key of an existing prerequisite  #### &#x60;updatePrerequisite&#x60;  Changes the prerequisite with flag key &#x60;key&#x60; to the variation indicated by &#x60;variationId&#x60;. Returns an error if this prerequisite does not exist.  ##### Parameters  - &#x60;key&#x60;: flag key of an existing prerequisite - &#x60;variationId&#x60;: ID of a variation of the flag with key &#x60;key&#x60;  #### &#x60;replacePrerequisites&#x60;  Completely replaces the existing set of prerequisites for a given flag. Example:  &#x60;&#x60;&#x60;json {   \&quot;kind\&quot;: \&quot;replacePrerequisites\&quot;,   \&quot;prerequisites\&quot;: [     {       \&quot;key\&quot;: \&quot;flag-key\&quot;,       \&quot;variationId\&quot;: \&quot;variation-1\&quot;     },     {       \&quot;key\&quot;: \&quot;another-flag\&quot;,       \&quot;variationId\&quot;: \&quot;variation-2\&quot;     }   ] } &#x60;&#x60;&#x60;  ##### Parameters  - &#x60;prerequisites&#x60;: a list of prerequisites  #### &#x60;addRule&#x60;  Adds a new rule to the flag with the given &#x60;clauses&#x60; which serves the variation indicated by &#x60;variationId&#x60; or the percent rollout indicated by &#x60;rolloutWeights&#x60; and &#x60;rolloutBucketBy&#x60;. If &#x60;beforeRuleId&#x60; is set, the rule will be added in the list of rules before the indicated rule. Otherwise, the rule will be added to the end of the list.  ##### Parameters  - &#x60;clauses&#x60;: Array of clauses (see &#x60;addClauses&#x60;) - &#x60;beforeRuleId&#x60;: Optional ID of a rule in the flag - &#x60;variationId&#x60;: ID of a variation of the flag - &#x60;rolloutWeights&#x60;: Map of variationId to weight in thousandths of a percent (0-100000) - &#x60;rolloutBucketBy&#x60;: Optional user attribute  #### &#x60;removeRule&#x60;  Removes the targeting rule specified by &#x60;ruleId&#x60;. Does nothing if the rule does not exist.  ##### Parameters  - &#x60;ruleId&#x60;: ID of a rule in the flag  #### &#x60;replaceRules&#x60;  Completely replaces the existing rules for a given flag. Example:  &#x60;&#x60;&#x60;json {   \&quot;kind\&quot;: \&quot;replaceRules\&quot;,   \&quot;rules\&quot;: [     {       \&quot;variationId\&quot;: \&quot;variation-1\&quot;,       \&quot;description\&quot;: \&quot;myRule\&quot;,       \&quot;clauses\&quot;: [         {           \&quot;attribute\&quot;: \&quot;segmentMatch\&quot;,           \&quot;op\&quot;: \&quot;segmentMatch\&quot;,           \&quot;values\&quot;: [\&quot;test\&quot;]         }       ],       \&quot;trackEvents\&quot;: true     }   ] } &#x60;&#x60;&#x60;  ##### Parameters  - &#x60;rules&#x60;: a list of rules  #### &#x60;addClauses&#x60;  Adds the given clauses to the rule indicated by &#x60;ruleId&#x60;.  ##### Parameters  - &#x60;ruleId&#x60;: ID of a rule in the flag - &#x60;clauses&#x60;: Array of clause objects, with &#x60;attribute&#x60; (string), &#x60;op&#x60; (string), and &#x60;values&#x60; (array of strings, numbers, or dates) properties.  #### &#x60;removeClauses&#x60;  Removes the clauses specified by &#x60;clauseIds&#x60; from the rule indicated by &#x60;ruleId&#x60;.  #### Parameters  - &#x60;ruleId&#x60;: ID of a rule in the flag - &#x60;clauseIds&#x60;: Array of IDs of clauses in the rule  #### &#x60;updateClause&#x60;  Replaces the clause indicated by &#x60;ruleId&#x60; and &#x60;clauseId&#x60; with &#x60;clause&#x60;.  ##### Parameters  - &#x60;ruleId&#x60;: ID of a rule in the flag - &#x60;clauseId&#x60;: ID of a clause in that rule - &#x60;clause&#x60;: Clause object  #### &#x60;addValuesToClause&#x60;  Adds &#x60;values&#x60; to the values of the clause indicated by &#x60;ruleId&#x60; and &#x60;clauseId&#x60;.  ##### Parameters  - &#x60;ruleId&#x60;: ID of a rule in the flag - &#x60;clauseId&#x60;: ID of a clause in that rule - &#x60;values&#x60;: Array of strings  #### &#x60;removeValuesFromClause&#x60;  Removes &#x60;values&#x60; from the values of the clause indicated by &#x60;ruleId&#x60; and &#x60;clauseId&#x60;.  ##### Parameters  &#x60;ruleId&#x60;: ID of a rule in the flag &#x60;clauseId&#x60;: ID of a clause in that rule &#x60;values&#x60;: Array of strings  #### &#x60;reorderRules&#x60;  Rearranges the rules to match the order given in &#x60;ruleIds&#x60;. Will return an error if &#x60;ruleIds&#x60; does not match the current set of rules on the flag.  ##### Parameters  - &#x60;ruleIds&#x60;: Array of IDs of all rules in the flag  #### &#x60;updateRuleVariationOrRollout&#x60;  Updates what the rule indicated by &#x60;ruleId&#x60; serves if its clauses evaluate to true. Can either be a fixed variation indicated by &#x60;variationId&#x60; or a percent rollout indicated by &#x60;rolloutWeights&#x60; and &#x60;rolloutBucketBy&#x60;.  ##### Parameters  - &#x60;ruleId&#x60;: ID of a rule in the flag - &#x60;variationId&#x60;: ID of a variation of the flag   or - &#x60;rolloutWeights&#x60;: Map of variationId to weight in thousandths of a percent (0-100000) - &#x60;rolloutBucketBy&#x60;: Optional user attribute  #### &#x60;updateFallthroughVariationOrRollout&#x60;  Updates the flag&#39;s fallthrough, which is served if none of the targeting rules match. Can either be a fixed variation indicated by &#x60;variationId&#x60; or a percent rollout indicated by &#x60;rolloutWeights&#x60; and &#x60;rolloutBucketBy&#x60;.  ##### Parameters  &#x60;variationId&#x60;: ID of a variation of the flag or &#x60;rolloutWeights&#x60;: Map of variationId to weight in thousandths of a percent (0-100000) &#x60;rolloutBucketBy&#x60;: Optional user attribute  #### &#x60;updateOffVariation&#x60;  Updates the variation served when the flag&#39;s targeting is off to the variation indicated by &#x60;variationId&#x60;.  ##### Parameters  &#x60;variationId&#x60;: ID of a variation of the flag  ### Example  &#x60;&#x60;&#x60;json {   \&quot;environmentKey\&quot;: \&quot;production\&quot;,   \&quot;instructions\&quot;: [     {       \&quot;kind\&quot;: \&quot;turnFlagOn\&quot;     },     {       \&quot;kind\&quot;: \&quot;turnFlagOff\&quot;     },     {       \&quot;kind\&quot;: \&quot;addUserTargets\&quot;,       \&quot;variationId\&quot;: \&quot;8bfb304e-d516-47e5-8727-e7f798e8992d\&quot;,       \&quot;values\&quot;: [\&quot;userId\&quot;, \&quot;userId2\&quot;]     },     {       \&quot;kind\&quot;: \&quot;removeUserTargets\&quot;,       \&quot;variationId\&quot;: \&quot;8bfb304e-d516-47e5-8727-e7f798e8992d\&quot;,       \&quot;values\&quot;: [\&quot;userId3\&quot;, \&quot;userId4\&quot;]     },     {       \&quot;kind\&quot;: \&quot;updateFallthroughVariationOrRollout\&quot;,       \&quot;rolloutWeights\&quot;: {         \&quot;variationId\&quot;: 50000,         \&quot;variationId2\&quot;: 50000       },       \&quot;rolloutBucketBy\&quot;: null     },     {       \&quot;kind\&quot;: \&quot;addRule\&quot;,       \&quot;clauses\&quot;: [         {           \&quot;attribute\&quot;: \&quot;segmentMatch\&quot;,           \&quot;negate\&quot;: false,           \&quot;values\&quot;: [\&quot;test-segment\&quot;]         }       ],       \&quot;variationId\&quot;: null,       \&quot;rolloutWeights\&quot;: {         \&quot;variationId\&quot;: 50000,         \&quot;variationId2\&quot;: 50000       },       \&quot;rolloutBucketBy\&quot;: \&quot;key\&quot;     },     {       \&quot;kind\&quot;: \&quot;removeRule\&quot;,       \&quot;ruleId\&quot;: \&quot;99f12464-a429-40fc-86cc-b27612188955\&quot;     },     {       \&quot;kind\&quot;: \&quot;reorderRules\&quot;,       \&quot;ruleIds\&quot;: [\&quot;2f72974e-de68-4243-8dd3-739582147a1f\&quot;, \&quot;8bfb304e-d516-47e5-8727-e7f798e8992d\&quot;]     },     {       \&quot;kind\&quot;: \&quot;addClauses\&quot;,       \&quot;ruleId\&quot;: \&quot;1134\&quot;,       \&quot;clauses\&quot;: [         {           \&quot;attribute\&quot;: \&quot;email\&quot;,           \&quot;op\&quot;: \&quot;in\&quot;,           \&quot;negate\&quot;: false,           \&quot;values\&quot;: [\&quot;test@test.com\&quot;]         }       ]     },     {       \&quot;kind\&quot;: \&quot;removeClauses\&quot;,       \&quot;ruleId\&quot;: \&quot;1242529\&quot;,       \&quot;clauseIds\&quot;: [\&quot;8bfb304e-d516-47e5-8727-e7f798e8992d\&quot;]     },     {       \&quot;kind\&quot;: \&quot;updateClause\&quot;,       \&quot;ruleId\&quot;: \&quot;2f72974e-de68-4243-8dd3-739582147a1f\&quot;,       \&quot;clauseId\&quot;: \&quot;309845\&quot;,       \&quot;clause\&quot;: {         \&quot;attribute\&quot;: \&quot;segmentMatch\&quot;,         \&quot;negate\&quot;: false,         \&quot;values\&quot;: [\&quot;test-segment\&quot;]       }     },     {       \&quot;kind\&quot;: \&quot;updateRuleVariationOrRollout\&quot;,       \&quot;ruleId\&quot;: \&quot;2342\&quot;,       \&quot;rolloutWeights\&quot;: null,       \&quot;rolloutBucketBy\&quot;: null     },     {       \&quot;kind\&quot;: \&quot;updateOffVariation\&quot;,       \&quot;variationId\&quot;: \&quot;3242453\&quot;     },     {       \&quot;kind\&quot;: \&quot;addPrerequisite\&quot;,       \&quot;variationId\&quot;: \&quot;234235\&quot;,       \&quot;key\&quot;: \&quot;flagKey2\&quot;     },     {       \&quot;kind\&quot;: \&quot;updatePrerequisite\&quot;,       \&quot;variationId\&quot;: \&quot;234235\&quot;,       \&quot;key\&quot;: \&quot;flagKey2\&quot;     },     {       \&quot;kind\&quot;: \&quot;removePrerequisite\&quot;,       \&quot;key\&quot;: \&quot;flagKey\&quot;     }   ] } &#x60;&#x60;&#x60;  ## Using JSON Patches on a feature flag If you do not include the header described above, you can use [JSON patch](/reference#updates-via-json-patch).  When using the update feature flag endpoint to add individual users to a specific variation, there are two different patch documents, depending on whether users are already being individually targeted for the variation.  If a flag variation already has users individually targeted, the path for the JSON Patch operation is:  &#x60;&#x60;&#x60;json {   \&quot;op\&quot;: \&quot;add\&quot;,   \&quot;path\&quot;: \&quot;/environments/devint/targets/0/values/-\&quot;,   \&quot;value\&quot;: \&quot;TestClient10\&quot; } &#x60;&#x60;&#x60;  If a flag variation does not already have users individually targeted, the path for the JSON Patch operation is:  &#x60;&#x60;&#x60;json [   {     \&quot;op\&quot;: \&quot;add\&quot;,     \&quot;path\&quot;: \&quot;/environments/devint/targets/-\&quot;,     \&quot;value\&quot;: { \&quot;variation\&quot;: 0, \&quot;values\&quot;: [\&quot;TestClient10\&quot;] }   } ] &#x60;&#x60;&#x60;   ## Required approvals If a request attempts to alter a flag configuration in an environment where approvals are required for the flag, the request will fail with a 405. Changes to the flag configuration in that environment will required creating an [approval request](/tag/Approvals) or a [workflow](/tag/Workflows-(beta)). This behavior can be bypassed by users and access tokens that have a [custom role](https://docs.launchdarkly.com/home/members/custom-roles) with permission to perform the &#x60;bypassRequiredApproval&#x60; action on the flag.  ## Conflicts If a flag configuration change made through this endpoint would cause a pending scheduled change or approval request to fail, this endpoint will return a 400. You can ignore this check by adding an &#x60;ignoreConflicts&#x60; query parameter set to &#x60;true&#x60;. 
    # @param project_key [String] The project key
    # @param feature_flag_key [String] The feature flag key. The key identifies the flag in your code.
    # @param patch_with_comment [PatchWithComment] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(FeatureFlag, Integer, Hash)>] FeatureFlag data, response status code and response headers
    def patch_feature_flag_with_http_info(project_key, feature_flag_key, patch_with_comment, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.patch_feature_flag ...'
      end
      # verify the required parameter 'project_key' is set
      if @api_client.config.client_side_validation && project_key.nil?
        fail ArgumentError, "Missing the required parameter 'project_key' when calling FeatureFlagsApi.patch_feature_flag"
      end
      # verify the required parameter 'feature_flag_key' is set
      if @api_client.config.client_side_validation && feature_flag_key.nil?
        fail ArgumentError, "Missing the required parameter 'feature_flag_key' when calling FeatureFlagsApi.patch_feature_flag"
      end
      # verify the required parameter 'patch_with_comment' is set
      if @api_client.config.client_side_validation && patch_with_comment.nil?
        fail ArgumentError, "Missing the required parameter 'patch_with_comment' when calling FeatureFlagsApi.patch_feature_flag"
      end
      # resource path
      local_var_path = '/api/v2/flags/{projectKey}/{featureFlagKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s)).sub('{' + 'featureFlagKey' + '}', CGI.escape(feature_flag_key.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(patch_with_comment)

      # return_type
      return_type = opts[:debug_return_type] || 'FeatureFlag'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.patch_feature_flag",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#patch_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create a feature flag
    # Create a feature flag with the given name, key, and variations
    # @param project_key [String] The project key
    # @param feature_flag_body [FeatureFlagBody] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :clone The key of the feature flag to be cloned. The key identifies the flag in your code. For example, setting &#x60;clone&#x3D;flagKey&#x60; copies the full targeting configuration for all environments, including &#x60;on/off&#x60; state, from the original flag to the new flag.
    # @return [FeatureFlag]
    def post_feature_flag(project_key, feature_flag_body, opts = {})
      data, _status_code, _headers = post_feature_flag_with_http_info(project_key, feature_flag_body, opts)
      data
    end

    # Create a feature flag
    # Create a feature flag with the given name, key, and variations
    # @param project_key [String] The project key
    # @param feature_flag_body [FeatureFlagBody] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :clone The key of the feature flag to be cloned. The key identifies the flag in your code. For example, setting &#x60;clone&#x3D;flagKey&#x60; copies the full targeting configuration for all environments, including &#x60;on/off&#x60; state, from the original flag to the new flag.
    # @return [Array<(FeatureFlag, Integer, Hash)>] FeatureFlag data, response status code and response headers
    def post_feature_flag_with_http_info(project_key, feature_flag_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FeatureFlagsApi.post_feature_flag ...'
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
      local_var_path = '/api/v2/flags/{projectKey}'.sub('{' + 'projectKey' + '}', CGI.escape(project_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'clone'] = opts[:'clone'] if !opts[:'clone'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(feature_flag_body)

      # return_type
      return_type = opts[:debug_return_type] || 'FeatureFlag'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKey']

      new_options = opts.merge(
        :operation => :"FeatureFlagsApi.post_feature_flag",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FeatureFlagsApi#post_feature_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
