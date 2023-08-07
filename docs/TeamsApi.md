# LaunchDarklyApi::TeamsApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_team**](TeamsApi.md#delete_team) | **DELETE** /api/v2/teams/{teamKey} | Delete team |
| [**get_team**](TeamsApi.md#get_team) | **GET** /api/v2/teams/{teamKey} | Get team |
| [**get_team_maintainers**](TeamsApi.md#get_team_maintainers) | **GET** /api/v2/teams/{teamKey}/maintainers | Get team maintainers |
| [**get_team_roles**](TeamsApi.md#get_team_roles) | **GET** /api/v2/teams/{teamKey}/roles | Get team custom roles |
| [**get_teams**](TeamsApi.md#get_teams) | **GET** /api/v2/teams | List teams |
| [**patch_team**](TeamsApi.md#patch_team) | **PATCH** /api/v2/teams/{teamKey} | Update team |
| [**post_team**](TeamsApi.md#post_team) | **POST** /api/v2/teams | Create team |
| [**post_team_members**](TeamsApi.md#post_team_members) | **POST** /api/v2/teams/{teamKey}/members | Add multiple members to team |


## delete_team

> delete_team(team_key)

Delete team

Delete a team by key. To learn more, read [Deleting a team](https://docs.launchdarkly.com/home/teams/managing#deleting-a-team).

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

api_instance = LaunchDarklyApi::TeamsApi.new
team_key = 'team_key_example' # String | The team key

begin
  # Delete team
  api_instance.delete_team(team_key)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->delete_team: #{e}"
end
```

#### Using the delete_team_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_team_with_http_info(team_key)

```ruby
begin
  # Delete team
  data, status_code, headers = api_instance.delete_team_with_http_info(team_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->delete_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_key** | **String** | The team key |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_team

> <Team> get_team(team_key, opts)

Get team

Fetch a team by key.

### Expanding the teams response LaunchDarkly supports four fields for expanding the \"Get team\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with any of the following fields:  * `members` includes the total count of members that belong to the team. * `roles` includes a paginated list of the custom roles that you have assigned to the team. * `projects` includes a paginated list of the projects that the team has any write access to. * `maintainers` includes a paginated list of the maintainers that you have assigned to the team.  For example, `expand=members,roles` includes the `members` and `roles` fields in the response. 

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

api_instance = LaunchDarklyApi::TeamsApi.new
team_key = 'team_key_example' # String | The team key.
opts = {
  expand: 'expand_example' # String | A comma-separated list of properties that can reveal additional information in the response.
}

begin
  # Get team
  result = api_instance.get_team(team_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->get_team: #{e}"
end
```

#### Using the get_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Team>, Integer, Hash)> get_team_with_http_info(team_key, opts)

```ruby
begin
  # Get team
  data, status_code, headers = api_instance.get_team_with_http_info(team_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Team>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->get_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_key** | **String** | The team key. |  |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. | [optional] |

### Return type

[**Team**](Team.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_team_maintainers

> <TeamMaintainers> get_team_maintainers(team_key, opts)

Get team maintainers

Fetch the maintainers that have been assigned to the team. To learn more, read [Managing team maintainers](https://docs.launchdarkly.com/home/teams/managing#managing-team-maintainers).

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

api_instance = LaunchDarklyApi::TeamsApi.new
team_key = 'team_key_example' # String | The team key
opts = {
  limit: 789, # Integer | The number of maintainers to return in the response. Defaults to 20.
  offset: 789 # Integer | Where to start in the list. This is for use with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query `limit`.
}

begin
  # Get team maintainers
  result = api_instance.get_team_maintainers(team_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->get_team_maintainers: #{e}"
end
```

#### Using the get_team_maintainers_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamMaintainers>, Integer, Hash)> get_team_maintainers_with_http_info(team_key, opts)

```ruby
begin
  # Get team maintainers
  data, status_code, headers = api_instance.get_team_maintainers_with_http_info(team_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamMaintainers>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->get_team_maintainers_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_key** | **String** | The team key |  |
| **limit** | **Integer** | The number of maintainers to return in the response. Defaults to 20. | [optional] |
| **offset** | **Integer** | Where to start in the list. This is for use with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query &#x60;limit&#x60;. | [optional] |

### Return type

[**TeamMaintainers**](TeamMaintainers.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_team_roles

> <TeamCustomRoles> get_team_roles(team_key, opts)

Get team custom roles

Fetch the custom roles that have been assigned to the team. To learn more, read [Managing team permissions](https://docs.launchdarkly.com/home/teams/managing#managing-team-permissions).

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

api_instance = LaunchDarklyApi::TeamsApi.new
team_key = 'team_key_example' # String | The team key
opts = {
  limit: 789, # Integer | The number of roles to return in the response. Defaults to 20.
  offset: 789 # Integer | Where to start in the list. This is for use with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query `limit`.
}

begin
  # Get team custom roles
  result = api_instance.get_team_roles(team_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->get_team_roles: #{e}"
end
```

#### Using the get_team_roles_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamCustomRoles>, Integer, Hash)> get_team_roles_with_http_info(team_key, opts)

```ruby
begin
  # Get team custom roles
  data, status_code, headers = api_instance.get_team_roles_with_http_info(team_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamCustomRoles>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->get_team_roles_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_key** | **String** | The team key |  |
| **limit** | **Integer** | The number of roles to return in the response. Defaults to 20. | [optional] |
| **offset** | **Integer** | Where to start in the list. This is for use with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query &#x60;limit&#x60;. | [optional] |

### Return type

[**TeamCustomRoles**](TeamCustomRoles.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_teams

> <Teams> get_teams(opts)

List teams

Return a list of teams.  By default, this returns the first 20 teams. Page through this list with the `limit` parameter and by following the `first`, `prev`, `next`, and `last` links in the `_links` field that returns. If those links do not appear, the pages they refer to don't exist. For example, the `first` and `prev` links will be missing from the response on the first page, because there is no previous page and you cannot return to the first page when you are already on the first page.

### Filtering teams  LaunchDarkly supports the following fields for filters:  - `query` is a string that matches against the teams' names and keys. It is not case-sensitive.   - A request with `query:abc` returns teams with the string `abc` in their name or key. - `nomembers` is a boolean that filters the list of teams who have 0 members   - A request with `nomembers:true` returns teams that have 0 members   - A request with `nomembers:false` returns teams that have 1 or more members

### Expanding the teams response LaunchDarkly supports four fields for expanding the \"List teams\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with any of the following fields:  * `members` includes the total count of members that belong to the team. * `roles` includes a paginated list of the custom roles that you have assigned to the team. * `projects` includes a paginated list of the projects that the team has any write access to. * `maintainers` includes a paginated list of the maintainers that you have assigned to the team.  For example, `expand=members,roles` includes the `members` and `roles` fields in the response. 

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

api_instance = LaunchDarklyApi::TeamsApi.new
opts = {
  limit: 789, # Integer | The number of teams to return in the response. Defaults to 20.
  offset: 789, # Integer | Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and returns the next `limit` items.
  filter: 'filter_example', # String | A comma-separated list of filters. Each filter is constructed as `field:value`.
  expand: 'expand_example' # String | A comma-separated list of properties that can reveal additional information in the response.
}

begin
  # List teams
  result = api_instance.get_teams(opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->get_teams: #{e}"
end
```

#### Using the get_teams_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Teams>, Integer, Hash)> get_teams_with_http_info(opts)

```ruby
begin
  # List teams
  data, status_code, headers = api_instance.get_teams_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Teams>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->get_teams_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | The number of teams to return in the response. Defaults to 20. | [optional] |
| **offset** | **Integer** | Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and returns the next &#x60;limit&#x60; items. | [optional] |
| **filter** | **String** | A comma-separated list of filters. Each filter is constructed as &#x60;field:value&#x60;. | [optional] |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. | [optional] |

### Return type

[**Teams**](Teams.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_team

> <Team> patch_team(team_key, team_patch_input, opts)

Update team

Perform a partial update to a team. Updating a team uses the semantic patch format.  To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).

### Instructions  Semantic patch requests support the following `kind` instructions for updating teams.

#### addCustomRoles  Adds custom roles to the team. Team members will have these custom roles granted to them.

##### Parameters  - `values`: List of custom role keys.

#### removeCustomRoles  Removes custom roles from the team. The app will no longer grant these custom roles to the team members.

##### Parameters  - `values`: List of custom role keys.

#### addMembers  Adds members to the team.

##### Parameters  - `values`: List of member IDs to add.

#### removeMembers  Removes members from the team.

##### Parameters  - `values`: List of member IDs to remove.

#### replaceMembers  Replaces the existing members of the team with the new members.

##### Parameters  - `values`: List of member IDs of the new members.

#### addPermissionGrants  Adds permission grants to members for the team. For example, a permission grant could allow a member to act as a team maintainer. A permission grant may have either an `actionSet` or a list of `actions` but not both at the same time. The members do not have to be team members to have a permission grant for the team.

##### Parameters  - `actionSet`: Name of the action set. - `actions`: List of actions. - `memberIDs`: List of member IDs.

#### removePermissionGrants  Removes permission grants from members for the team. The `actionSet` and `actions` must match an existing permission grant.

##### Parameters  - `actionSet`: Name of the action set. - `actions`: List of actions. - `memberIDs`: List of member IDs.

#### updateDescription  Updates the description of the team.

##### Parameters  - `value`: The new description.

#### updateName  Updates the name of the team.

##### Parameters  - `value`: The new name.

### Expanding the teams response LaunchDarkly supports four fields for expanding the \"Update team\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with any of the following fields:  * `members` includes the total count of members that belong to the team. * `roles` includes a paginated list of the custom roles that you have assigned to the team. * `projects` includes a paginated list of the projects that the team has any write access to. * `maintainers` includes a paginated list of the maintainers that you have assigned to the team.  For example, `expand=members,roles` includes the `members` and `roles` fields in the response. 

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

api_instance = LaunchDarklyApi::TeamsApi.new
team_key = 'team_key_example' # String | The team key
team_patch_input = LaunchDarklyApi::TeamPatchInput.new({instructions: [{ key: 3.56}]}) # TeamPatchInput | 
opts = {
  expand: 'expand_example' # String | A comma-separated list of properties that can reveal additional information in the response. Supported fields are explained above.
}

begin
  # Update team
  result = api_instance.patch_team(team_key, team_patch_input, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->patch_team: #{e}"
end
```

#### Using the patch_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Team>, Integer, Hash)> patch_team_with_http_info(team_key, team_patch_input, opts)

```ruby
begin
  # Update team
  data, status_code, headers = api_instance.patch_team_with_http_info(team_key, team_patch_input, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Team>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->patch_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_key** | **String** | The team key |  |
| **team_patch_input** | [**TeamPatchInput**](TeamPatchInput.md) |  |  |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. Supported fields are explained above. | [optional] |

### Return type

[**Team**](Team.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_team

> <Team> post_team(team_post_input, opts)

Create team

Create a team. To learn more, read [Creating a team](https://docs.launchdarkly.com/home/teams/creating).

### Expanding the teams response LaunchDarkly supports four fields for expanding the \"Create team\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with any of the following fields:  * `members` includes the total count of members that belong to the team. * `roles` includes a paginated list of the custom roles that you have assigned to the team. * `projects` includes a paginated list of the projects that the team has any write access to. * `maintainers` includes a paginated list of the maintainers that you have assigned to the team.  For example, `expand=members,roles` includes the `members` and `roles` fields in the response. 

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

api_instance = LaunchDarklyApi::TeamsApi.new
team_post_input = LaunchDarklyApi::TeamPostInput.new({key: 'team-key-123abc', name: 'Example team'}) # TeamPostInput | 
opts = {
  expand: 'expand_example' # String | A comma-separated list of properties that can reveal additional information in the response. Supported fields are explained above.
}

begin
  # Create team
  result = api_instance.post_team(team_post_input, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->post_team: #{e}"
end
```

#### Using the post_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Team>, Integer, Hash)> post_team_with_http_info(team_post_input, opts)

```ruby
begin
  # Create team
  data, status_code, headers = api_instance.post_team_with_http_info(team_post_input, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Team>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->post_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_post_input** | [**TeamPostInput**](TeamPostInput.md) |  |  |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. Supported fields are explained above. | [optional] |

### Return type

[**Team**](Team.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_team_members

> <TeamImportsRep> post_team_members(team_key, opts)

Add multiple members to team

Add multiple members to an existing team by uploading a CSV file of member email addresses. Your CSV file must include email addresses in the first column. You can include data in additional columns, but LaunchDarkly ignores all data outside the first column. Headers are optional. To learn more, read [Managing team members](https://docs.launchdarkly.com/home/teams/managing#managing-team-members).  **Members are only added on a `201` response.** A `207` indicates the CSV file contains a combination of valid and invalid entries. A `207` results in no members being added to the team.  On a `207` response, if an entry contains bad input, the `message` field contains the row number as well as the reason for the error. The `message` field is omitted if the entry is valid.  Example `207` response: ```json {   \"items\": [     {       \"status\": \"success\",       \"value\": \"new-team-member@acme.com\"     },     {       \"message\": \"Line 2: empty row\",       \"status\": \"error\",       \"value\": \"\"     },     {       \"message\": \"Line 3: email already exists in the specified team\",       \"status\": \"error\",       \"value\": \"existing-team-member@acme.com\"     },     {       \"message\": \"Line 4: invalid email formatting\",       \"status\": \"error\",       \"value\": \"invalid email format\"     }   ] } ```  Message | Resolution --- | --- Empty row | This line is blank. Add an email address and try again. Duplicate entry | This email address appears in the file twice. Remove the email from the file and try again. Email already exists in the specified team | This member is already on your team. Remove the email from the file and try again. Invalid formatting | This email address is not formatted correctly. Fix the formatting and try again. Email does not belong to a LaunchDarkly member | The email address doesn't belong to a LaunchDarkly account member. Invite them to LaunchDarkly, then re-add them to the team.  On a `400` response, the `message` field may contain errors specific to this endpoint.  Example `400` response: ```json {   \"code\": \"invalid_request\",   \"message\": \"Unable to process file\" } ```  Message | Resolution --- | --- Unable to process file | LaunchDarkly could not process the file for an unspecified reason. Review your file for errors and try again. File exceeds 25mb | Break up your file into multiple files of less than 25mbs each. All emails have invalid formatting | None of the email addresses in the file are in the correct format. Fix the formatting and try again. All emails belong to existing team members | All listed members are already on this team. Populate the file with member emails that do not belong to the team and try again. File is empty | The CSV file does not contain any email addresses. Populate the file and try again. No emails belong to members of your LaunchDarkly organization | None of the email addresses belong to members of your LaunchDarkly account. Invite these members to LaunchDarkly, then re-add them to the team. 

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

api_instance = LaunchDarklyApi::TeamsApi.new
team_key = 'team_key_example' # String | The team key
opts = {
  file: File.new('/path/to/some/file') # File | CSV file containing email addresses
}

begin
  # Add multiple members to team
  result = api_instance.post_team_members(team_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->post_team_members: #{e}"
end
```

#### Using the post_team_members_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamImportsRep>, Integer, Hash)> post_team_members_with_http_info(team_key, opts)

```ruby
begin
  # Add multiple members to team
  data, status_code, headers = api_instance.post_team_members_with_http_info(team_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamImportsRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling TeamsApi->post_team_members_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_key** | **String** | The team key |  |
| **file** | **File** | CSV file containing email addresses | [optional] |

### Return type

[**TeamImportsRep**](TeamImportsRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

