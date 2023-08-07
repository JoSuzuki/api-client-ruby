# LaunchDarklyApi::AccountMembersApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_member**](AccountMembersApi.md#delete_member) | **DELETE** /api/v2/members/{id} | Delete account member |
| [**get_member**](AccountMembersApi.md#get_member) | **GET** /api/v2/members/{id} | Get account member |
| [**get_members**](AccountMembersApi.md#get_members) | **GET** /api/v2/members | List account members |
| [**patch_member**](AccountMembersApi.md#patch_member) | **PATCH** /api/v2/members/{id} | Modify an account member |
| [**post_member_teams**](AccountMembersApi.md#post_member_teams) | **POST** /api/v2/members/{id}/teams | Add a member to teams |
| [**post_members**](AccountMembersApi.md#post_members) | **POST** /api/v2/members | Invite new members |


## delete_member

> delete_member(id)

Delete account member

Delete a single account member by ID. Requests to delete account members will not work if SCIM is enabled for the account.

### Examples

```ruby
require 'time'
require 'launchdarkly_api'
# setup authorization
LaunchDarklyApi.configure do |config|
  # Configure API key authorization: ApiKey
  config.api_key['ApiKey'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['ApiKey'] = 'Bearer'
end

api_instance = LaunchDarklyApi::AccountMembersApi.new
id = 'id_example' # String | The member ID

begin
  # Delete account member
  api_instance.delete_member(id)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->delete_member: #{e}"
end
```

#### Using the delete_member_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_member_with_http_info(id)

```ruby
begin
  # Delete account member
  data, status_code, headers = api_instance.delete_member_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->delete_member_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The member ID |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_member

> <Member> get_member(id)

Get account member

Get a single account member by member ID.  `me` is a reserved value for the `id` parameter that returns the caller's member information. 

### Examples

```ruby
require 'time'
require 'launchdarkly_api'
# setup authorization
LaunchDarklyApi.configure do |config|
  # Configure API key authorization: ApiKey
  config.api_key['ApiKey'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['ApiKey'] = 'Bearer'
end

api_instance = LaunchDarklyApi::AccountMembersApi.new
id = 'id_example' # String | The member ID

begin
  # Get account member
  result = api_instance.get_member(id)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->get_member: #{e}"
end
```

#### Using the get_member_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Member>, Integer, Hash)> get_member_with_http_info(id)

```ruby
begin
  # Get account member
  data, status_code, headers = api_instance.get_member_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Member>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->get_member_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The member ID |  |

### Return type

[**Member**](Member.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_members

> <Members> get_members(opts)

List account members

Return a list of account members.  By default, this returns the first 20 members. Page through this list with the `limit` parameter and by following the `first`, `prev`, `next`, and `last` links in the returned `_links` field. These links are not present if the pages they refer to don't exist. For example, the `first` and `prev` links will be missing from the response on the first page.

### Filtering members  LaunchDarkly supports the following fields for filters:  - `query` is a string that matches against the members' emails and names. It is not case sensitive. - `role` is a `|` separated list of roles and custom roles. It filters the list to members who have any of the roles in the list. For the purposes of this filtering, `Owner` counts as `Admin`. - `team` is a string that matches against the key of the teams the members belong to. It is not case sensitive. - `noteam` is a boolean that filters the list of members who are not on a team if true and members on a team if false. - `lastSeen` is a JSON object in one of the following formats:   - `{\"never\": true}` - Members that have never been active, such as those who have not accepted their invitation to LaunchDarkly, or have not logged in after being provisioned via SCIM.   - `{\"noData\": true}` - Members that have not been active since LaunchDarkly began recording last seen timestamps.   - `{\"before\": 1608672063611}` - Members that have not been active since the provided value, which should be a timestamp in Unix epoch milliseconds. - `accessCheck` is a string that represents a specific action on a specific resource and is in the format `<ActionSpecifier>:<ResourceSpecifier>`. It filters the list to members who have the ability to perform that action on that resource.    - For example, the filter `accessCheck:createApprovalRequest:proj/default:env/test:flag/alternate-page` matches members with the ability to create an approval request for the `alternate-page` flag in the `test` environment of the `default` project.   - Wildcard and tag filters are not supported when filtering for access.  For example, the filter `query:abc,role:admin|customrole` matches members with the string `abc` in their email or name, ignoring case, who also are either an `Owner` or `Admin` or have the custom role `customrole`.

### Sorting members  LaunchDarkly supports two fields for sorting: `displayName` and `lastSeen`:  - `displayName` sorts by first + last name, using the member's email if no name is set. - `lastSeen` sorts by the `_lastSeen` property. LaunchDarkly considers members that have never been seen or have no data the oldest. 

### Examples

```ruby
require 'time'
require 'launchdarkly_api'
# setup authorization
LaunchDarklyApi.configure do |config|
  # Configure API key authorization: ApiKey
  config.api_key['ApiKey'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['ApiKey'] = 'Bearer'
end

api_instance = LaunchDarklyApi::AccountMembersApi.new
opts = {
  limit: 789, # Integer | The number of members to return in the response. Defaults to 20.
  offset: 789, # Integer | Where to start in the list. This is for use with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query `limit`.
  filter: 'filter_example', # String | A comma-separated list of filters. Each filter is of the form `field:value`. Supported fields are explained above.
  sort: 'sort_example' # String | A comma-separated list of fields to sort by. Fields prefixed by a dash ( - ) sort in descending order.
}

begin
  # List account members
  result = api_instance.get_members(opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->get_members: #{e}"
end
```

#### Using the get_members_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Members>, Integer, Hash)> get_members_with_http_info(opts)

```ruby
begin
  # List account members
  data, status_code, headers = api_instance.get_members_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Members>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->get_members_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | The number of members to return in the response. Defaults to 20. | [optional] |
| **offset** | **Integer** | Where to start in the list. This is for use with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query &#x60;limit&#x60;. | [optional] |
| **filter** | **String** | A comma-separated list of filters. Each filter is of the form &#x60;field:value&#x60;. Supported fields are explained above. | [optional] |
| **sort** | **String** | A comma-separated list of fields to sort by. Fields prefixed by a dash ( - ) sort in descending order. | [optional] |

### Return type

[**Members**](Members.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_member

> <Member> patch_member(id, patch_operation)

Modify an account member

 Update a single account member. The request should be a valid JSON Patch document describing the changes to be made to the member.  To update fields in the account member object that are arrays, set the `path` to the name of the field and then append `/<array index>`. Using `/0` appends to the beginning of the array. For example, to add a new custom role to a member, use the following request body:  ```   [     {       \"op\": \"add\",       \"path\": \"/customRoles/0\",       \"value\": \"some-role-id\"     }   ] ```  When SAML SSO or SCIM is enabled for the account, account members are managed in the Identity Provider (IdP). Requests to update account members will succeed, but the IdP will override the update shortly afterwards. 

### Examples

```ruby
require 'time'
require 'launchdarkly_api'
# setup authorization
LaunchDarklyApi.configure do |config|
  # Configure API key authorization: ApiKey
  config.api_key['ApiKey'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['ApiKey'] = 'Bearer'
end

api_instance = LaunchDarklyApi::AccountMembersApi.new
id = 'id_example' # String | The member ID
patch_operation = [LaunchDarklyApi::PatchOperation.new({op: 'replace', path: '/exampleField', value: new example value})] # Array<PatchOperation> | 

begin
  # Modify an account member
  result = api_instance.patch_member(id, patch_operation)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->patch_member: #{e}"
end
```

#### Using the patch_member_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Member>, Integer, Hash)> patch_member_with_http_info(id, patch_operation)

```ruby
begin
  # Modify an account member
  data, status_code, headers = api_instance.patch_member_with_http_info(id, patch_operation)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Member>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->patch_member_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The member ID |  |
| **patch_operation** | [**Array&lt;PatchOperation&gt;**](PatchOperation.md) |  |  |

### Return type

[**Member**](Member.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_member_teams

> <Member> post_member_teams(id, member_teams_post_input)

Add a member to teams

Add one member to one or more teams.

### Examples

```ruby
require 'time'
require 'launchdarkly_api'
# setup authorization
LaunchDarklyApi.configure do |config|
  # Configure API key authorization: ApiKey
  config.api_key['ApiKey'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['ApiKey'] = 'Bearer'
end

api_instance = LaunchDarklyApi::AccountMembersApi.new
id = 'id_example' # String | The member ID
member_teams_post_input = LaunchDarklyApi::MemberTeamsPostInput.new({team_keys: ["team1", "team2"]}) # MemberTeamsPostInput | 

begin
  # Add a member to teams
  result = api_instance.post_member_teams(id, member_teams_post_input)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->post_member_teams: #{e}"
end
```

#### Using the post_member_teams_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Member>, Integer, Hash)> post_member_teams_with_http_info(id, member_teams_post_input)

```ruby
begin
  # Add a member to teams
  data, status_code, headers = api_instance.post_member_teams_with_http_info(id, member_teams_post_input)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Member>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->post_member_teams_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The member ID |  |
| **member_teams_post_input** | [**MemberTeamsPostInput**](MemberTeamsPostInput.md) |  |  |

### Return type

[**Member**](Member.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_members

> <Members> post_members(new_member_form)

Invite new members

> ### Full use of this API resource is an Enterprise feature > > The ability to bulk invite members is available to customers on an Enterprise plan. If you are on a Pro plan, you can invite members individually. To learn more, [read about our pricing](https://launchdarkly.com/pricing/). To upgrade your plan, [contact Sales](https://launchdarkly.com/contact-sales/).  Invite one or more new members to join an account. Each member is sent an invitation. Members with \"admin\" or \"owner\" roles may create new members, as well as anyone with a \"createMember\" permission for \"member/\\*\". If a member cannot be invited, the entire request is rejected and no members are invited from that request.  Each member _must_ have an `email` field and either a `role` or a `customRoles` field. If any of the fields are not populated correctly, the request is rejected with the reason specified in the \"message\" field of the response.  Requests to create account members will not work if SCIM is enabled for the account.  _No more than 50 members may be created per request._  A request may also fail because of conflicts with existing members. These conflicts are reported using the additional `code` and `invalid_emails` response fields with the following possible values for `code`:  - **email_already_exists_in_account**: A member with this email address already exists in this account. - **email_taken_in_different_account**: A member with this email address exists in another account. - **duplicate_email**s: This request contains two or more members with the same email address.  A request that fails for one of the above reasons returns an HTTP response code of 400 (Bad Request). 

### Examples

```ruby
require 'time'
require 'launchdarkly_api'
# setup authorization
LaunchDarklyApi.configure do |config|
  # Configure API key authorization: ApiKey
  config.api_key['ApiKey'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['ApiKey'] = 'Bearer'
end

api_instance = LaunchDarklyApi::AccountMembersApi.new
new_member_form = [LaunchDarklyApi::NewMemberForm.new({email: 'sandy@acme.com'})] # Array<NewMemberForm> | 

begin
  # Invite new members
  result = api_instance.post_members(new_member_form)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->post_members: #{e}"
end
```

#### Using the post_members_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Members>, Integer, Hash)> post_members_with_http_info(new_member_form)

```ruby
begin
  # Invite new members
  data, status_code, headers = api_instance.post_members_with_http_info(new_member_form)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Members>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersApi->post_members_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **new_member_form** | [**Array&lt;NewMemberForm&gt;**](NewMemberForm.md) |  |  |

### Return type

[**Members**](Members.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

