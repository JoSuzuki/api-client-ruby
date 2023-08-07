# LaunchDarklyApi::FlagTriggersApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_trigger_workflow**](FlagTriggersApi.md#create_trigger_workflow) | **POST** /api/v2/flags/{projectKey}/{featureFlagKey}/triggers/{environmentKey} | Create flag trigger |
| [**delete_trigger_workflow**](FlagTriggersApi.md#delete_trigger_workflow) | **DELETE** /api/v2/flags/{projectKey}/{featureFlagKey}/triggers/{environmentKey}/{id} | Delete flag trigger |
| [**get_trigger_workflow_by_id**](FlagTriggersApi.md#get_trigger_workflow_by_id) | **GET** /api/v2/flags/{projectKey}/{featureFlagKey}/triggers/{environmentKey}/{id} | Get flag trigger by ID |
| [**get_trigger_workflows**](FlagTriggersApi.md#get_trigger_workflows) | **GET** /api/v2/flags/{projectKey}/{featureFlagKey}/triggers/{environmentKey} | List flag triggers |
| [**patch_trigger_workflow**](FlagTriggersApi.md#patch_trigger_workflow) | **PATCH** /api/v2/flags/{projectKey}/{featureFlagKey}/triggers/{environmentKey}/{id} | Update flag trigger |


## create_trigger_workflow

> <TriggerWorkflowRep> create_trigger_workflow(project_key, environment_key, feature_flag_key, trigger_post)

Create flag trigger

Create a new flag trigger.

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

api_instance = LaunchDarklyApi::FlagTriggersApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
trigger_post = LaunchDarklyApi::TriggerPost.new({integration_key: 'generic-trigger'}) # TriggerPost | 

begin
  # Create flag trigger
  result = api_instance.create_trigger_workflow(project_key, environment_key, feature_flag_key, trigger_post)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->create_trigger_workflow: #{e}"
end
```

#### Using the create_trigger_workflow_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TriggerWorkflowRep>, Integer, Hash)> create_trigger_workflow_with_http_info(project_key, environment_key, feature_flag_key, trigger_post)

```ruby
begin
  # Create flag trigger
  data, status_code, headers = api_instance.create_trigger_workflow_with_http_info(project_key, environment_key, feature_flag_key, trigger_post)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TriggerWorkflowRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->create_trigger_workflow_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **trigger_post** | [**TriggerPost**](TriggerPost.md) |  |  |

### Return type

[**TriggerWorkflowRep**](TriggerWorkflowRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_trigger_workflow

> delete_trigger_workflow(project_key, environment_key, feature_flag_key, id)

Delete flag trigger

Delete a flag trigger by ID.

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

api_instance = LaunchDarklyApi::FlagTriggersApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
id = 'id_example' # String | The flag trigger ID

begin
  # Delete flag trigger
  api_instance.delete_trigger_workflow(project_key, environment_key, feature_flag_key, id)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->delete_trigger_workflow: #{e}"
end
```

#### Using the delete_trigger_workflow_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_trigger_workflow_with_http_info(project_key, environment_key, feature_flag_key, id)

```ruby
begin
  # Delete flag trigger
  data, status_code, headers = api_instance.delete_trigger_workflow_with_http_info(project_key, environment_key, feature_flag_key, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->delete_trigger_workflow_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **id** | **String** | The flag trigger ID |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_trigger_workflow_by_id

> <TriggerWorkflowRep> get_trigger_workflow_by_id(project_key, feature_flag_key, environment_key, id)

Get flag trigger by ID

Get a flag trigger by ID.

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

api_instance = LaunchDarklyApi::FlagTriggersApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The flag trigger ID

begin
  # Get flag trigger by ID
  result = api_instance.get_trigger_workflow_by_id(project_key, feature_flag_key, environment_key, id)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->get_trigger_workflow_by_id: #{e}"
end
```

#### Using the get_trigger_workflow_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TriggerWorkflowRep>, Integer, Hash)> get_trigger_workflow_by_id_with_http_info(project_key, feature_flag_key, environment_key, id)

```ruby
begin
  # Get flag trigger by ID
  data, status_code, headers = api_instance.get_trigger_workflow_by_id_with_http_info(project_key, feature_flag_key, environment_key, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TriggerWorkflowRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->get_trigger_workflow_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The flag trigger ID |  |

### Return type

[**TriggerWorkflowRep**](TriggerWorkflowRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_trigger_workflows

> <TriggerWorkflowCollectionRep> get_trigger_workflows(project_key, environment_key, feature_flag_key)

List flag triggers

Get a list of all flag triggers.

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

api_instance = LaunchDarklyApi::FlagTriggersApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key

begin
  # List flag triggers
  result = api_instance.get_trigger_workflows(project_key, environment_key, feature_flag_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->get_trigger_workflows: #{e}"
end
```

#### Using the get_trigger_workflows_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TriggerWorkflowCollectionRep>, Integer, Hash)> get_trigger_workflows_with_http_info(project_key, environment_key, feature_flag_key)

```ruby
begin
  # List flag triggers
  data, status_code, headers = api_instance.get_trigger_workflows_with_http_info(project_key, environment_key, feature_flag_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TriggerWorkflowCollectionRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->get_trigger_workflows_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |

### Return type

[**TriggerWorkflowCollectionRep**](TriggerWorkflowCollectionRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_trigger_workflow

> <TriggerWorkflowRep> patch_trigger_workflow(project_key, environment_key, feature_flag_key, id, flag_trigger_input)

Update flag trigger

Update a flag trigger. Updating a flag trigger uses the semantic patch format.  To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).

### Instructions  Semantic patch requests support the following `kind` instructions for updating flag triggers.

#### replaceTriggerActionInstructions  Removes the existing trigger action and replaces it with the new instructions.

##### Parameters  - `value`: An array of the new `kind`s of actions to perform when triggering. Supported flag actions are `turnFlagOn` and `turnFlagOff`.  For example, to replace the trigger action instructions, use this request body:  ```json {   \"comment\": \"optional comment\",   \"instructions\": [     {       \"kind\": \"replaceTriggerActionInstructions\",       \"value\": [ {\"kind\": \"turnFlagOff\"} ]     }   ] } ```

#### cycleTriggerUrl  Generates a new URL for this trigger. You must update any clients using the trigger to use this new URL.

#### disableTrigger  Disables the trigger. This saves the trigger configuration, but the trigger stops running. To re-enable, use `enableTrigger`.

#### enableTrigger  Enables the trigger. If you previously disabled the trigger, it begins running again. 

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

api_instance = LaunchDarklyApi::FlagTriggersApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
id = 'id_example' # String | The flag trigger ID
flag_trigger_input = LaunchDarklyApi::FlagTriggerInput.new # FlagTriggerInput | 

begin
  # Update flag trigger
  result = api_instance.patch_trigger_workflow(project_key, environment_key, feature_flag_key, id, flag_trigger_input)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->patch_trigger_workflow: #{e}"
end
```

#### Using the patch_trigger_workflow_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TriggerWorkflowRep>, Integer, Hash)> patch_trigger_workflow_with_http_info(project_key, environment_key, feature_flag_key, id, flag_trigger_input)

```ruby
begin
  # Update flag trigger
  data, status_code, headers = api_instance.patch_trigger_workflow_with_http_info(project_key, environment_key, feature_flag_key, id, flag_trigger_input)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TriggerWorkflowRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FlagTriggersApi->patch_trigger_workflow_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **id** | **String** | The flag trigger ID |  |
| **flag_trigger_input** | [**FlagTriggerInput**](FlagTriggerInput.md) |  |  |

### Return type

[**TriggerWorkflowRep**](TriggerWorkflowRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

