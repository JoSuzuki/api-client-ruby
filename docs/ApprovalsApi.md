# LaunchDarklyApi::ApprovalsApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_approval_request_for_flag**](ApprovalsApi.md#delete_approval_request_for_flag) | **DELETE** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{id} | Delete approval request for a flag |
| [**get_approval_for_flag**](ApprovalsApi.md#get_approval_for_flag) | **GET** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{id} | Get approval request for a flag |
| [**get_approvals_for_flag**](ApprovalsApi.md#get_approvals_for_flag) | **GET** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests | List approval requests for a flag |
| [**post_approval_request_apply_for_flag**](ApprovalsApi.md#post_approval_request_apply_for_flag) | **POST** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{id}/apply | Apply approval request for a flag |
| [**post_approval_request_for_flag**](ApprovalsApi.md#post_approval_request_for_flag) | **POST** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests | Create approval request for a flag |
| [**post_approval_request_review_for_flag**](ApprovalsApi.md#post_approval_request_review_for_flag) | **POST** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{id}/reviews | Review approval request for a flag |
| [**post_flag_copy_config_approval_request**](ApprovalsApi.md#post_flag_copy_config_approval_request) | **POST** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests-flag-copy | Create approval request to copy flag configurations across environments |


## delete_approval_request_for_flag

> delete_approval_request_for_flag(project_key, feature_flag_key, environment_key, id)

Delete approval request for a flag

Delete an approval request for a feature flag.

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

api_instance = LaunchDarklyApi::ApprovalsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The feature flag approval request ID

begin
  # Delete approval request for a flag
  api_instance.delete_approval_request_for_flag(project_key, feature_flag_key, environment_key, id)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->delete_approval_request_for_flag: #{e}"
end
```

#### Using the delete_approval_request_for_flag_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_approval_request_for_flag_with_http_info(project_key, feature_flag_key, environment_key, id)

```ruby
begin
  # Delete approval request for a flag
  data, status_code, headers = api_instance.delete_approval_request_for_flag_with_http_info(project_key, feature_flag_key, environment_key, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->delete_approval_request_for_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The feature flag approval request ID |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_approval_for_flag

> <FlagConfigApprovalRequestResponse> get_approval_for_flag(project_key, feature_flag_key, environment_key, id)

Get approval request for a flag

Get a single approval request for a feature flag.

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

api_instance = LaunchDarklyApi::ApprovalsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The feature flag approval request ID

begin
  # Get approval request for a flag
  result = api_instance.get_approval_for_flag(project_key, feature_flag_key, environment_key, id)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->get_approval_for_flag: #{e}"
end
```

#### Using the get_approval_for_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FlagConfigApprovalRequestResponse>, Integer, Hash)> get_approval_for_flag_with_http_info(project_key, feature_flag_key, environment_key, id)

```ruby
begin
  # Get approval request for a flag
  data, status_code, headers = api_instance.get_approval_for_flag_with_http_info(project_key, feature_flag_key, environment_key, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FlagConfigApprovalRequestResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->get_approval_for_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The feature flag approval request ID |  |

### Return type

[**FlagConfigApprovalRequestResponse**](FlagConfigApprovalRequestResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_approvals_for_flag

> <FlagConfigApprovalRequestsResponse> get_approvals_for_flag(project_key, feature_flag_key, environment_key)

List approval requests for a flag

Get all approval requests for a feature flag.

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

api_instance = LaunchDarklyApi::ApprovalsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key

begin
  # List approval requests for a flag
  result = api_instance.get_approvals_for_flag(project_key, feature_flag_key, environment_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->get_approvals_for_flag: #{e}"
end
```

#### Using the get_approvals_for_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FlagConfigApprovalRequestsResponse>, Integer, Hash)> get_approvals_for_flag_with_http_info(project_key, feature_flag_key, environment_key)

```ruby
begin
  # List approval requests for a flag
  data, status_code, headers = api_instance.get_approvals_for_flag_with_http_info(project_key, feature_flag_key, environment_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FlagConfigApprovalRequestsResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->get_approvals_for_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |

### Return type

[**FlagConfigApprovalRequestsResponse**](FlagConfigApprovalRequestsResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## post_approval_request_apply_for_flag

> <FlagConfigApprovalRequestResponse> post_approval_request_apply_for_flag(project_key, feature_flag_key, environment_key, id, post_approval_request_apply_request)

Apply approval request for a flag

Apply an approval request that has been approved.

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

api_instance = LaunchDarklyApi::ApprovalsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The feature flag approval request ID
post_approval_request_apply_request = LaunchDarklyApi::PostApprovalRequestApplyRequest.new # PostApprovalRequestApplyRequest | 

begin
  # Apply approval request for a flag
  result = api_instance.post_approval_request_apply_for_flag(project_key, feature_flag_key, environment_key, id, post_approval_request_apply_request)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->post_approval_request_apply_for_flag: #{e}"
end
```

#### Using the post_approval_request_apply_for_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FlagConfigApprovalRequestResponse>, Integer, Hash)> post_approval_request_apply_for_flag_with_http_info(project_key, feature_flag_key, environment_key, id, post_approval_request_apply_request)

```ruby
begin
  # Apply approval request for a flag
  data, status_code, headers = api_instance.post_approval_request_apply_for_flag_with_http_info(project_key, feature_flag_key, environment_key, id, post_approval_request_apply_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FlagConfigApprovalRequestResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->post_approval_request_apply_for_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The feature flag approval request ID |  |
| **post_approval_request_apply_request** | [**PostApprovalRequestApplyRequest**](PostApprovalRequestApplyRequest.md) |  |  |

### Return type

[**FlagConfigApprovalRequestResponse**](FlagConfigApprovalRequestResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_approval_request_for_flag

> <FlagConfigApprovalRequestResponse> post_approval_request_for_flag(project_key, feature_flag_key, environment_key, create_flag_config_approval_request_request)

Create approval request for a flag

Create an approval request for a feature flag.

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

api_instance = LaunchDarklyApi::ApprovalsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
create_flag_config_approval_request_request = LaunchDarklyApi::CreateFlagConfigApprovalRequestRequest.new({description: 'Requesting to update targeting', instructions: [{ key: 3.56}]}) # CreateFlagConfigApprovalRequestRequest | 

begin
  # Create approval request for a flag
  result = api_instance.post_approval_request_for_flag(project_key, feature_flag_key, environment_key, create_flag_config_approval_request_request)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->post_approval_request_for_flag: #{e}"
end
```

#### Using the post_approval_request_for_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FlagConfigApprovalRequestResponse>, Integer, Hash)> post_approval_request_for_flag_with_http_info(project_key, feature_flag_key, environment_key, create_flag_config_approval_request_request)

```ruby
begin
  # Create approval request for a flag
  data, status_code, headers = api_instance.post_approval_request_for_flag_with_http_info(project_key, feature_flag_key, environment_key, create_flag_config_approval_request_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FlagConfigApprovalRequestResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->post_approval_request_for_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **create_flag_config_approval_request_request** | [**CreateFlagConfigApprovalRequestRequest**](CreateFlagConfigApprovalRequestRequest.md) |  |  |

### Return type

[**FlagConfigApprovalRequestResponse**](FlagConfigApprovalRequestResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_approval_request_review_for_flag

> <FlagConfigApprovalRequestResponse> post_approval_request_review_for_flag(project_key, feature_flag_key, environment_key, id, post_approval_request_review_request)

Review approval request for a flag

Review an approval request by approving or denying changes.

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

api_instance = LaunchDarklyApi::ApprovalsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The feature flag approval request ID
post_approval_request_review_request = LaunchDarklyApi::PostApprovalRequestReviewRequest.new # PostApprovalRequestReviewRequest | 

begin
  # Review approval request for a flag
  result = api_instance.post_approval_request_review_for_flag(project_key, feature_flag_key, environment_key, id, post_approval_request_review_request)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->post_approval_request_review_for_flag: #{e}"
end
```

#### Using the post_approval_request_review_for_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FlagConfigApprovalRequestResponse>, Integer, Hash)> post_approval_request_review_for_flag_with_http_info(project_key, feature_flag_key, environment_key, id, post_approval_request_review_request)

```ruby
begin
  # Review approval request for a flag
  data, status_code, headers = api_instance.post_approval_request_review_for_flag_with_http_info(project_key, feature_flag_key, environment_key, id, post_approval_request_review_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FlagConfigApprovalRequestResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->post_approval_request_review_for_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The feature flag approval request ID |  |
| **post_approval_request_review_request** | [**PostApprovalRequestReviewRequest**](PostApprovalRequestReviewRequest.md) |  |  |

### Return type

[**FlagConfigApprovalRequestResponse**](FlagConfigApprovalRequestResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_flag_copy_config_approval_request

> <FlagConfigApprovalRequestResponse> post_flag_copy_config_approval_request(project_key, feature_flag_key, environment_key, create_copy_flag_config_approval_request_request)

Create approval request to copy flag configurations across environments

Create an approval request to copy a feature flag's configuration across environments.

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

api_instance = LaunchDarklyApi::ApprovalsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key for the target environment
create_copy_flag_config_approval_request_request = LaunchDarklyApi::CreateCopyFlagConfigApprovalRequestRequest.new({description: 'copy flag settings to another environment', source: LaunchDarklyApi::SourceFlag.new({key: 'environment-key-123abc'})}) # CreateCopyFlagConfigApprovalRequestRequest | 

begin
  # Create approval request to copy flag configurations across environments
  result = api_instance.post_flag_copy_config_approval_request(project_key, feature_flag_key, environment_key, create_copy_flag_config_approval_request_request)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->post_flag_copy_config_approval_request: #{e}"
end
```

#### Using the post_flag_copy_config_approval_request_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FlagConfigApprovalRequestResponse>, Integer, Hash)> post_flag_copy_config_approval_request_with_http_info(project_key, feature_flag_key, environment_key, create_copy_flag_config_approval_request_request)

```ruby
begin
  # Create approval request to copy flag configurations across environments
  data, status_code, headers = api_instance.post_flag_copy_config_approval_request_with_http_info(project_key, feature_flag_key, environment_key, create_copy_flag_config_approval_request_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FlagConfigApprovalRequestResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ApprovalsApi->post_flag_copy_config_approval_request_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key for the target environment |  |
| **create_copy_flag_config_approval_request_request** | [**CreateCopyFlagConfigApprovalRequestRequest**](CreateCopyFlagConfigApprovalRequestRequest.md) |  |  |

### Return type

[**FlagConfigApprovalRequestResponse**](FlagConfigApprovalRequestResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

