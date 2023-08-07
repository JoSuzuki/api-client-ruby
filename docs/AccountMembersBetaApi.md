# LaunchDarklyApi::AccountMembersBetaApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**patch_members**](AccountMembersBetaApi.md#patch_members) | **PATCH** /api/v2/members | Modify account members |


## patch_members

> <BulkEditMembersRep> patch_members(members_patch_input)

Modify account members

Perform a partial update to multiple members. Updating members uses the semantic patch format.  To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).

### Instructions  Semantic patch requests support the following `kind` instructions for updating members.

#### replaceMembersRoles  Replaces the roles of the specified members. This also removes all custom roles assigned to the specified members.

##### Parameters  - `value`: The new role. Must be a valid built-in role. To learn more about built-in roles, read [LaunchDarkly's built-in roles](https://docs.launchdarkly.com/home/members/built-in-roles). - `memberIDs`: List of member IDs.

#### replaceAllMembersRoles  Replaces the roles of all members. This also removes all custom roles assigned to the specified members.  Members that match any of the filters are excluded from the update.

##### Parameters  - `value`: The new role. Must be a valid built-in role. To learn more about built-in roles, read [LaunchDarkly's built-in roles](https://docs.launchdarkly.com/home/members/built-in-roles). - `filterLastSeen`: (Optional) A JSON object with one of the following formats:   - `{\"never\": true}` - Members that have never been active, such as those who have not accepted their invitation to LaunchDarkly, or have not logged in after being provisioned via SCIM.   - `{\"noData\": true}` - Members that have not been active since LaunchDarkly began recording last seen timestamps.   - `{\"before\": 1608672063611}` - Members that have not been active since the provided value, which should be a timestamp in Unix epoch milliseconds. - `filterQuery`: (Optional) A string that matches against the members' emails and names. It is not case sensitive. - `filterRoles`: (Optional) A `|` separated list of roles and custom roles. For the purposes of this filtering, `Owner` counts as `Admin`. - `filterTeamKey`: (Optional) A string that matches against the key of the team the members belong to. It is not case sensitive. - `ignoredMemberIDs`: (Optional) A list of member IDs.

#### replaceMembersCustomRoles  Replaces the custom roles of the specified members.

##### Parameters  - `values`: List of new custom roles. Must be a valid custom role key or ID. - `memberIDs`: List of member IDs.

#### replaceAllMembersCustomRoles  Replaces the custom roles of all members. Members that match any of the filters are excluded from the update.

##### Parameters  - `values`: List of new roles. Must be a valid custom role key or ID. - `filterLastSeen`: (Optional) A JSON object with one of the following formats:   - `{\"never\": true}` - Members that have never been active, such as those who have not accepted their invitation to LaunchDarkly, or have not logged in after being provisioned via SCIM.   - `{\"noData\": true}` - Members that have not been active since LaunchDarkly began recording last seen timestamps.   - `{\"before\": 1608672063611}` - Members that have not been active since the provided value, which should be a timestamp in Unix epoch milliseconds. - `filterQuery`: (Optional) A string that matches against the members' emails and names. It is not case sensitive. - `filterRoles`: (Optional) A `|` separated list of roles and custom roles. For the purposes of this filtering, `Owner` counts as `Admin`. - `filterTeamKey`: (Optional) A string that matches against the key of the team the members belong to. It is not case sensitive. - `ignoredMemberIDs`: (Optional) A list of member IDs. 

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

api_instance = LaunchDarklyApi::AccountMembersBetaApi.new
members_patch_input = LaunchDarklyApi::MembersPatchInput.new({instructions: [{ key: 3.56}]}) # MembersPatchInput | 

begin
  # Modify account members
  result = api_instance.patch_members(members_patch_input)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersBetaApi->patch_members: #{e}"
end
```

#### Using the patch_members_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkEditMembersRep>, Integer, Hash)> patch_members_with_http_info(members_patch_input)

```ruby
begin
  # Modify account members
  data, status_code, headers = api_instance.patch_members_with_http_info(members_patch_input)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkEditMembersRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling AccountMembersBetaApi->patch_members_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **members_patch_input** | [**MembersPatchInput**](MembersPatchInput.md) |  |  |

### Return type

[**BulkEditMembersRep**](BulkEditMembersRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

