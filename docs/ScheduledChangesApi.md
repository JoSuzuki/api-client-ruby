# LaunchDarklyApi::ScheduledChangesApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_flag_config_scheduled_changes**](ScheduledChangesApi.md#delete_flag_config_scheduled_changes) | **DELETE** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes/{id} | Delete scheduled changes workflow |
| [**get_feature_flag_scheduled_change**](ScheduledChangesApi.md#get_feature_flag_scheduled_change) | **GET** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes/{id} | Get a scheduled change |
| [**get_flag_config_scheduled_changes**](ScheduledChangesApi.md#get_flag_config_scheduled_changes) | **GET** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes | List scheduled changes |
| [**patch_flag_config_scheduled_change**](ScheduledChangesApi.md#patch_flag_config_scheduled_change) | **PATCH** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes/{id} | Update scheduled changes workflow |
| [**post_flag_config_scheduled_changes**](ScheduledChangesApi.md#post_flag_config_scheduled_changes) | **POST** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes | Create scheduled changes workflow |


## delete_flag_config_scheduled_changes

> delete_flag_config_scheduled_changes(project_key, feature_flag_key, environment_key, id)

Delete scheduled changes workflow

Delete a scheduled changes workflow.

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

api_instance = LaunchDarklyApi::ScheduledChangesApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The scheduled change id

begin
  # Delete scheduled changes workflow
  api_instance.delete_flag_config_scheduled_changes(project_key, feature_flag_key, environment_key, id)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->delete_flag_config_scheduled_changes: #{e}"
end
```

#### Using the delete_flag_config_scheduled_changes_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_flag_config_scheduled_changes_with_http_info(project_key, feature_flag_key, environment_key, id)

```ruby
begin
  # Delete scheduled changes workflow
  data, status_code, headers = api_instance.delete_flag_config_scheduled_changes_with_http_info(project_key, feature_flag_key, environment_key, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->delete_flag_config_scheduled_changes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The scheduled change id |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_feature_flag_scheduled_change

> <FeatureFlagScheduledChange> get_feature_flag_scheduled_change(project_key, feature_flag_key, environment_key, id)

Get a scheduled change

Get a scheduled change that will be applied to the feature flag by ID.

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

api_instance = LaunchDarklyApi::ScheduledChangesApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The scheduled change id

begin
  # Get a scheduled change
  result = api_instance.get_feature_flag_scheduled_change(project_key, feature_flag_key, environment_key, id)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->get_feature_flag_scheduled_change: #{e}"
end
```

#### Using the get_feature_flag_scheduled_change_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlagScheduledChange>, Integer, Hash)> get_feature_flag_scheduled_change_with_http_info(project_key, feature_flag_key, environment_key, id)

```ruby
begin
  # Get a scheduled change
  data, status_code, headers = api_instance.get_feature_flag_scheduled_change_with_http_info(project_key, feature_flag_key, environment_key, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlagScheduledChange>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->get_feature_flag_scheduled_change_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The scheduled change id |  |

### Return type

[**FeatureFlagScheduledChange**](FeatureFlagScheduledChange.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_flag_config_scheduled_changes

> <FeatureFlagScheduledChanges> get_flag_config_scheduled_changes(project_key, feature_flag_key, environment_key)

List scheduled changes

Get a list of scheduled changes that will be applied to the feature flag.

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

api_instance = LaunchDarklyApi::ScheduledChangesApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key

begin
  # List scheduled changes
  result = api_instance.get_flag_config_scheduled_changes(project_key, feature_flag_key, environment_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->get_flag_config_scheduled_changes: #{e}"
end
```

#### Using the get_flag_config_scheduled_changes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlagScheduledChanges>, Integer, Hash)> get_flag_config_scheduled_changes_with_http_info(project_key, feature_flag_key, environment_key)

```ruby
begin
  # List scheduled changes
  data, status_code, headers = api_instance.get_flag_config_scheduled_changes_with_http_info(project_key, feature_flag_key, environment_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlagScheduledChanges>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->get_flag_config_scheduled_changes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |

### Return type

[**FeatureFlagScheduledChanges**](FeatureFlagScheduledChanges.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_flag_config_scheduled_change

> <FeatureFlagScheduledChange> patch_flag_config_scheduled_change(project_key, feature_flag_key, environment_key, id, flag_scheduled_changes_input, opts)

Update scheduled changes workflow

 Update a scheduled change, overriding existing instructions with the new ones. Updating a scheduled change uses the semantic patch format.  To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).

### Instructions  Semantic patch requests support the following `kind` instructions for updating scheduled changes.

#### deleteScheduledChange  Removes the scheduled change.

#### replaceScheduledChangesInstructions  Removes the existing scheduled changes and replaces them with the new instructions.

##### Parameters  - `value`: An array of the new actions to perform when the execution date for these scheduled changes arrives. Supported scheduled actions are `turnFlagOn` and `turnFlagOff`.  For example, to replace the scheduled changes, use this request body:  ```json {   \"comment\": \"optional comment\",   \"instructions\": [     {       \"kind\": \"replaceScheduledChangesInstructions\",       \"value\": [ {\"kind\": \"turnFlagOff\"} ]     }   ] } ```

#### updateScheduledChangesExecutionDate  Updates the execution date for the scheduled changes.

##### Parameters  - `value`: the new execution date, in Unix milliseconds. 

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

api_instance = LaunchDarklyApi::ScheduledChangesApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The scheduled change ID
flag_scheduled_changes_input = LaunchDarklyApi::FlagScheduledChangesInput.new({instructions: [{ key: 3.56}]}) # FlagScheduledChangesInput | 
opts = {
  ignore_conflicts: true # Boolean | Whether to succeed (`true`) or fail (`false`) when these new instructions conflict with existing scheduled changes
}

begin
  # Update scheduled changes workflow
  result = api_instance.patch_flag_config_scheduled_change(project_key, feature_flag_key, environment_key, id, flag_scheduled_changes_input, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->patch_flag_config_scheduled_change: #{e}"
end
```

#### Using the patch_flag_config_scheduled_change_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlagScheduledChange>, Integer, Hash)> patch_flag_config_scheduled_change_with_http_info(project_key, feature_flag_key, environment_key, id, flag_scheduled_changes_input, opts)

```ruby
begin
  # Update scheduled changes workflow
  data, status_code, headers = api_instance.patch_flag_config_scheduled_change_with_http_info(project_key, feature_flag_key, environment_key, id, flag_scheduled_changes_input, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlagScheduledChange>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->patch_flag_config_scheduled_change_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The scheduled change ID |  |
| **flag_scheduled_changes_input** | [**FlagScheduledChangesInput**](FlagScheduledChangesInput.md) |  |  |
| **ignore_conflicts** | **Boolean** | Whether to succeed (&#x60;true&#x60;) or fail (&#x60;false&#x60;) when these new instructions conflict with existing scheduled changes | [optional] |

### Return type

[**FeatureFlagScheduledChange**](FeatureFlagScheduledChange.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_flag_config_scheduled_changes

> <FeatureFlagScheduledChange> post_flag_config_scheduled_changes(project_key, feature_flag_key, environment_key, post_flag_scheduled_changes_input, opts)

Create scheduled changes workflow

Create scheduled changes for a feature flag. If the `ignoreConficts` query parameter is false and there are conflicts between these instructions and existing scheduled changes, the request will fail. If the parameter is true and there are conflicts, the request will succeed.

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

api_instance = LaunchDarklyApi::ScheduledChangesApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
post_flag_scheduled_changes_input = LaunchDarklyApi::PostFlagScheduledChangesInput.new({execution_date: 3.56, instructions: [{ key: 3.56}]}) # PostFlagScheduledChangesInput | 
opts = {
  ignore_conflicts: true # Boolean | Whether to succeed (`true`) or fail (`false`) when these instructions conflict with existing scheduled changes
}

begin
  # Create scheduled changes workflow
  result = api_instance.post_flag_config_scheduled_changes(project_key, feature_flag_key, environment_key, post_flag_scheduled_changes_input, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->post_flag_config_scheduled_changes: #{e}"
end
```

#### Using the post_flag_config_scheduled_changes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlagScheduledChange>, Integer, Hash)> post_flag_config_scheduled_changes_with_http_info(project_key, feature_flag_key, environment_key, post_flag_scheduled_changes_input, opts)

```ruby
begin
  # Create scheduled changes workflow
  data, status_code, headers = api_instance.post_flag_config_scheduled_changes_with_http_info(project_key, feature_flag_key, environment_key, post_flag_scheduled_changes_input, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlagScheduledChange>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ScheduledChangesApi->post_flag_config_scheduled_changes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **post_flag_scheduled_changes_input** | [**PostFlagScheduledChangesInput**](PostFlagScheduledChangesInput.md) |  |  |
| **ignore_conflicts** | **Boolean** | Whether to succeed (&#x60;true&#x60;) or fail (&#x60;false&#x60;) when these instructions conflict with existing scheduled changes | [optional] |

### Return type

[**FeatureFlagScheduledChange**](FeatureFlagScheduledChange.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

