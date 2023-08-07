# LaunchDarklyApi::TeamsBetaApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**patch_teams**](TeamsBetaApi.md#patch_teams) | **PATCH** /api/v2/teams | Update teams |


## patch_teams

> <BulkEditTeamsRep> patch_teams(teams_patch_input)

Update teams

Perform a partial update to multiple teams. Updating teams uses the semantic patch format.  To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).

### Instructions  Semantic patch requests support the following `kind` instructions for updating teams.

#### addMembersToTeams  Add the members to teams.

##### Parameters  - `memberIDs`: List of member IDs to add. - `teamKeys`: List of teams to update.

#### addAllMembersToTeams  Add all members to the team. Members that match any of the filters are excluded from the update.

##### Parameters  - `teamKeys`: List of teams to update. - `filterLastSeen`: (Optional) A JSON object with one of the following formats:   - `{\"never\": true}` - Members that have never been active, such as those who have not accepted their invitation to LaunchDarkly, or have not logged in after being provisioned via SCIM.   - `{\"noData\": true}` - Members that have not been active since LaunchDarkly began recording last seen timestamps.   - `{\"before\": 1608672063611}` - Members that have not been active since the provided value, which should be a timestamp in Unix epoch milliseconds. - `filterQuery`: (Optional) A string that matches against the members' emails and names. It is not case sensitive. - `filterRoles`: (Optional) A `|` separated list of roles and custom roles. For the purposes of this filtering, `Owner` counts as `Admin`. - `filterTeamKey`: (Optional) A string that matches against the key of the team the members belong to. It is not case sensitive. - `ignoredMemberIDs`: (Optional) A list of member IDs. 

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

api_instance = LaunchDarklyApi::TeamsBetaApi.new
teams_patch_input = LaunchDarklyApi::TeamsPatchInput.new({instructions: [{ key: 3.56}]}) # TeamsPatchInput | 

begin
  # Update teams
  result = api_instance.patch_teams(teams_patch_input)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsBetaApi->patch_teams: #{e}"
end
```

#### Using the patch_teams_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkEditTeamsRep>, Integer, Hash)> patch_teams_with_http_info(teams_patch_input)

```ruby
begin
  # Update teams
  data, status_code, headers = api_instance.patch_teams_with_http_info(teams_patch_input)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkEditTeamsRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsBetaApi->patch_teams_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **teams_patch_input** | [**TeamsPatchInput**](TeamsPatchInput.md) |  |  |

### Return type

[**BulkEditTeamsRep**](BulkEditTeamsRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

