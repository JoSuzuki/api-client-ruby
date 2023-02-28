# LaunchDarklyApi::FeatureFlagsApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**copy_feature_flag**](FeatureFlagsApi.md#copy_feature_flag) | **POST** /api/v2/flags/{projectKey}/{featureFlagKey}/copy | Copy feature flag |
| [**delete_feature_flag**](FeatureFlagsApi.md#delete_feature_flag) | **DELETE** /api/v2/flags/{projectKey}/{featureFlagKey} | Delete feature flag |
| [**get_expiring_context_targets**](FeatureFlagsApi.md#get_expiring_context_targets) | **GET** /api/v2/flags/{projectKey}/{featureFlagKey}/expiring-targets/{environmentKey} | Get expiring context targets for feature flag |
| [**get_expiring_user_targets**](FeatureFlagsApi.md#get_expiring_user_targets) | **GET** /api/v2/flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey} | Get expiring user targets for feature flag |
| [**get_feature_flag**](FeatureFlagsApi.md#get_feature_flag) | **GET** /api/v2/flags/{projectKey}/{featureFlagKey} | Get feature flag |
| [**get_feature_flag_status**](FeatureFlagsApi.md#get_feature_flag_status) | **GET** /api/v2/flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey} | Get feature flag status |
| [**get_feature_flag_status_across_environments**](FeatureFlagsApi.md#get_feature_flag_status_across_environments) | **GET** /api/v2/flag-status/{projectKey}/{featureFlagKey} | Get flag status across environments |
| [**get_feature_flag_statuses**](FeatureFlagsApi.md#get_feature_flag_statuses) | **GET** /api/v2/flag-statuses/{projectKey}/{environmentKey} | List feature flag statuses |
| [**get_feature_flags**](FeatureFlagsApi.md#get_feature_flags) | **GET** /api/v2/flags/{projectKey} | List feature flags |
| [**patch_expiring_targets**](FeatureFlagsApi.md#patch_expiring_targets) | **PATCH** /api/v2/flags/{projectKey}/{featureFlagKey}/expiring-targets/{environmentKey} | Update expiring context targets on feature flag |
| [**patch_expiring_user_targets**](FeatureFlagsApi.md#patch_expiring_user_targets) | **PATCH** /api/v2/flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey} | Update expiring user targets on feature flag |
| [**patch_feature_flag**](FeatureFlagsApi.md#patch_feature_flag) | **PATCH** /api/v2/flags/{projectKey}/{featureFlagKey} | Update feature flag |
| [**post_feature_flag**](FeatureFlagsApi.md#post_feature_flag) | **POST** /api/v2/flags/{projectKey} | Create a feature flag |


## copy_feature_flag

> <FeatureFlag> copy_feature_flag(project_key, feature_flag_key, flag_copy_config_post)

Copy feature flag

 > ### Copying flag settings is an Enterprise feature > > Copying flag settings is available to customers on an Enterprise plan. To learn more, [read about our pricing](https://launchdarkly.com/pricing/). To upgrade your plan, [contact Sales](https://launchdarkly.com/contact-sales/).  Copy flag settings from a source environment to a target environment.  By default, this operation copies the entire flag configuration. You can use the `includedActions` or `excludedActions` to specify that only part of the flag configuration is copied.  If you provide the optional `currentVersion` of a flag, this operation tests to ensure that the current flag version in the environment matches the version you've specified. The operation rejects attempts to copy flag settings if the environment's current version  of the flag does not match the version you've specified. You can use this to enforce optimistic locking on copy attempts. 

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key. The key identifies the flag in your code.
flag_copy_config_post = LaunchDarklyApi::FlagCopyConfigPost.new({source: LaunchDarklyApi::FlagCopyConfigEnvironment.new({key: 'key_example'}), target: LaunchDarklyApi::FlagCopyConfigEnvironment.new({key: 'key_example'})}) # FlagCopyConfigPost | 

begin
  # Copy feature flag
  result = api_instance.copy_feature_flag(project_key, feature_flag_key, flag_copy_config_post)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->copy_feature_flag: #{e}"
end
```

#### Using the copy_feature_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlag>, Integer, Hash)> copy_feature_flag_with_http_info(project_key, feature_flag_key, flag_copy_config_post)

```ruby
begin
  # Copy feature flag
  data, status_code, headers = api_instance.copy_feature_flag_with_http_info(project_key, feature_flag_key, flag_copy_config_post)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlag>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->copy_feature_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key. The key identifies the flag in your code. |  |
| **flag_copy_config_post** | [**FlagCopyConfigPost**](FlagCopyConfigPost.md) |  |  |

### Return type

[**FeatureFlag**](FeatureFlag.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_feature_flag

> delete_feature_flag(project_key, feature_flag_key)

Delete feature flag

Delete a feature flag in all environments. Use with caution: only delete feature flags your application no longer uses.

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key. The key identifies the flag in your code.

begin
  # Delete feature flag
  api_instance.delete_feature_flag(project_key, feature_flag_key)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->delete_feature_flag: #{e}"
end
```

#### Using the delete_feature_flag_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_feature_flag_with_http_info(project_key, feature_flag_key)

```ruby
begin
  # Delete feature flag
  data, status_code, headers = api_instance.delete_feature_flag_with_http_info(project_key, feature_flag_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->delete_feature_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key. The key identifies the flag in your code. |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_expiring_context_targets

> <ExpiringTargetGetResponse> get_expiring_context_targets(project_key, environment_key, feature_flag_key)

Get expiring context targets for feature flag

Get a list of context targets on a feature flag that are scheduled for removal.

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key

begin
  # Get expiring context targets for feature flag
  result = api_instance.get_expiring_context_targets(project_key, environment_key, feature_flag_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_expiring_context_targets: #{e}"
end
```

#### Using the get_expiring_context_targets_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExpiringTargetGetResponse>, Integer, Hash)> get_expiring_context_targets_with_http_info(project_key, environment_key, feature_flag_key)

```ruby
begin
  # Get expiring context targets for feature flag
  data, status_code, headers = api_instance.get_expiring_context_targets_with_http_info(project_key, environment_key, feature_flag_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExpiringTargetGetResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_expiring_context_targets_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |

### Return type

[**ExpiringTargetGetResponse**](ExpiringTargetGetResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_expiring_user_targets

> <ExpiringUserTargetGetResponse> get_expiring_user_targets(project_key, environment_key, feature_flag_key)

Get expiring user targets for feature flag

 > ### Contexts are now available > > After you have upgraded your LaunchDarkly SDK to use contexts instead of users, you should use [Get expiring context targets for feature flag](/tag/Feature-flags#operation/getExpiringContextTargets) instead of this endpoint. To learn more, read [Contexts](https://docs.launchdarkly.com/home/contexts).  Get a list of user targets on a feature flag that are scheduled for removal. 

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key

begin
  # Get expiring user targets for feature flag
  result = api_instance.get_expiring_user_targets(project_key, environment_key, feature_flag_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_expiring_user_targets: #{e}"
end
```

#### Using the get_expiring_user_targets_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExpiringUserTargetGetResponse>, Integer, Hash)> get_expiring_user_targets_with_http_info(project_key, environment_key, feature_flag_key)

```ruby
begin
  # Get expiring user targets for feature flag
  data, status_code, headers = api_instance.get_expiring_user_targets_with_http_info(project_key, environment_key, feature_flag_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExpiringUserTargetGetResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_expiring_user_targets_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |

### Return type

[**ExpiringUserTargetGetResponse**](ExpiringUserTargetGetResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_feature_flag

> <FeatureFlag> get_feature_flag(project_key, feature_flag_key, opts)

Get feature flag

Get a single feature flag by key. By default, this returns the configurations for all environments. You can filter environments with the `env` query parameter. For example, setting `env=production` restricts the returned configurations to just the `production` environment.

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
opts = {
  env: 'env_example' # String | Filter configurations by environment
}

begin
  # Get feature flag
  result = api_instance.get_feature_flag(project_key, feature_flag_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flag: #{e}"
end
```

#### Using the get_feature_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlag>, Integer, Hash)> get_feature_flag_with_http_info(project_key, feature_flag_key, opts)

```ruby
begin
  # Get feature flag
  data, status_code, headers = api_instance.get_feature_flag_with_http_info(project_key, feature_flag_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlag>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **env** | **String** | Filter configurations by environment | [optional] |

### Return type

[**FeatureFlag**](FeatureFlag.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_feature_flag_status

> <FlagStatusRep> get_feature_flag_status(project_key, environment_key, feature_flag_key)

Get feature flag status

Get the status for a particular feature flag.

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key

begin
  # Get feature flag status
  result = api_instance.get_feature_flag_status(project_key, environment_key, feature_flag_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flag_status: #{e}"
end
```

#### Using the get_feature_flag_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FlagStatusRep>, Integer, Hash)> get_feature_flag_status_with_http_info(project_key, environment_key, feature_flag_key)

```ruby
begin
  # Get feature flag status
  data, status_code, headers = api_instance.get_feature_flag_status_with_http_info(project_key, environment_key, feature_flag_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FlagStatusRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flag_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |

### Return type

[**FlagStatusRep**](FlagStatusRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_feature_flag_status_across_environments

> <FeatureFlagStatusAcrossEnvironments> get_feature_flag_status_across_environments(project_key, feature_flag_key, opts)

Get flag status across environments

Get the status for a particular feature flag across environments.

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
opts = {
  env: 'env_example' # String | Optional environment filter
}

begin
  # Get flag status across environments
  result = api_instance.get_feature_flag_status_across_environments(project_key, feature_flag_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flag_status_across_environments: #{e}"
end
```

#### Using the get_feature_flag_status_across_environments_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlagStatusAcrossEnvironments>, Integer, Hash)> get_feature_flag_status_across_environments_with_http_info(project_key, feature_flag_key, opts)

```ruby
begin
  # Get flag status across environments
  data, status_code, headers = api_instance.get_feature_flag_status_across_environments_with_http_info(project_key, feature_flag_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlagStatusAcrossEnvironments>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flag_status_across_environments_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **env** | **String** | Optional environment filter | [optional] |

### Return type

[**FeatureFlagStatusAcrossEnvironments**](FeatureFlagStatusAcrossEnvironments.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_feature_flag_statuses

> <FeatureFlagStatuses> get_feature_flag_statuses(project_key, environment_key)

List feature flag statuses

Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as a state, which is one of the following:  - `new`: the feature flag was created within the last seven days, and has not been requested yet - `active`: the feature flag was requested within the last seven days - `inactive`: the feature flag was created more than seven days ago, and hasn't been requested within the past seven days - `launched`: one variation of the feature flag has been rolled out for at least seven days 

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key

begin
  # List feature flag statuses
  result = api_instance.get_feature_flag_statuses(project_key, environment_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flag_statuses: #{e}"
end
```

#### Using the get_feature_flag_statuses_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlagStatuses>, Integer, Hash)> get_feature_flag_statuses_with_http_info(project_key, environment_key)

```ruby
begin
  # List feature flag statuses
  data, status_code, headers = api_instance.get_feature_flag_statuses_with_http_info(project_key, environment_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlagStatuses>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flag_statuses_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |

### Return type

[**FeatureFlagStatuses**](FeatureFlagStatuses.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_feature_flags

> <FeatureFlags> get_feature_flags(project_key, opts)

List feature flags

Get a list of all features in the given project. By default, each feature includes configurations for each environment. You can filter environments with the `env` query parameter. For example, setting `env=production` restricts the returned configurations to just your production environment. You can also filter feature flags by tag with the tag query parameter.  ### Filtering flags  You can filter on certain fields using the `filter` query parameter. For example, setting `filter=query:dark-mode,tags:beta+test` matches flags with the string `dark-mode` in their key or name, ignoring case, which also have the tags `beta` and `test`.  The `filter` query parameter supports the following arguments:  - `query` is a string that matches against the flags' keys and names. It is not case sensitive. - `archived` is a boolean with values of `true` or `false` that filters the list to archived flags. Setting the value to `true` returns only archived flags. When this is absent, only unarchived flags are returned. - `type` is a string allowing filtering to `temporary` or `permanent` flags. - `status` is a string allowing filtering to `new`, `inactive`, `active`, or `launched` flags in the specified environment. This filter also requires a `filterEnv` field to be set to a valid environment. For example: `filter=status:active,filterEnv:production`. - `tags` is a `+` separated list of tags. It filters the list to members who have all of the tags in the list. For example: `filter=tags:beta+test`. - `hasExperiment` is a boolean with values of `true` or `false` that returns any flags that are used in an experiment. - `hasDataExport` is a boolean with values of `true` or `false` that returns any flags that are exporting data in the specified environment. This includes flags that are exporting data from Experimentation. This filter also requires that you set a `filterEnv` field to a valid environment key. For example: `filter=hasDataExport:true,filterEnv:production` - `evaluated` is an object that contains a key of `after` and a value in Unix time in milliseconds. This returns all flags that have been evaluated since the time you specify in the environment provided. This filter also requires you to set a `filterEnv` field to a valid environment. For example: `filter=evaluated:{\"after\": 1590768455282},filterEnv:production`. - `filterEnv` is a string with the key of a valid environment. You can use the `filterEnv` field for filters that are environment-specific. If there are multiple environment-specific filters, you should only declare this parameter once. For example: `filter=evaluated:{\"after\": 1590768455282},filterEnv:production,status:active`.  By default, this returns all flags. You can page through the list with the `limit` parameter and by following the `first`, `prev`, `next`, and `last` links in the returned `_links` field. These links will not be present if the pages they refer to don't exist. For example, the `first` and `prev` links will be missing from the response on the first page.  ### Sorting flags  You can sort flags based on the following fields:  - `creationDate` sorts by the creation date of the flag. - `key` sorts by the key of the flag. - `maintainerId` sorts by the flag maintainer. - `name` sorts by flag name. - `tags` sorts by tags. - `targetingModifiedDate` sorts by the date that the flag's targeting rules were last modified in a given environment. It must be used with `env` parameter and it can not be combined with any other sort. If multiple `env` values are provided, it will perform sort using the first one. For example, `sort=-targetingModifiedDate&env=production&env=staging` returns results sorted by `targetingModifiedDate` for the `production` environment. - `type` sorts by flag type  All fields are sorted in ascending order by default. To sort in descending order, prefix the field with a dash ( - ). For example, `sort=-name` sorts the response by flag name in descending order. 

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
opts = {
  env: 'env_example', # String | Filter configurations by environment
  tag: 'tag_example', # String | Filter feature flags by tag
  limit: 789, # Integer | The number of feature flags to return. Defaults to -1, which returns all flags
  offset: 789, # Integer | Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query `limit`.
  archived: true, # Boolean | A boolean to filter the list to archived flags. When this is absent, only unarchived flags will be returned
  summary: true, # Boolean | By default in API version >= 1, flags will _not_ include their list of prerequisites, targets or rules.  Set summary=0 to include these fields for each flag returned
  filter: 'filter_example', # String | A comma-separated list of filters. Each filter is of the form field:value. Read the endpoint description for a full list of available filter fields.
  sort: 'sort_example', # String | A comma-separated list of fields to sort by. Fields prefixed by a dash ( - ) sort in descending order. Read the endpoint description for a full list of available sort fields.
  compare: true # Boolean | A boolean to filter results by only flags that have differences between environments
}

begin
  # List feature flags
  result = api_instance.get_feature_flags(project_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flags: #{e}"
end
```

#### Using the get_feature_flags_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlags>, Integer, Hash)> get_feature_flags_with_http_info(project_key, opts)

```ruby
begin
  # List feature flags
  data, status_code, headers = api_instance.get_feature_flags_with_http_info(project_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlags>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->get_feature_flags_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **env** | **String** | Filter configurations by environment | [optional] |
| **tag** | **String** | Filter feature flags by tag | [optional] |
| **limit** | **Integer** | The number of feature flags to return. Defaults to -1, which returns all flags | [optional] |
| **offset** | **Integer** | Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query &#x60;limit&#x60;. | [optional] |
| **archived** | **Boolean** | A boolean to filter the list to archived flags. When this is absent, only unarchived flags will be returned | [optional] |
| **summary** | **Boolean** | By default in API version &gt;&#x3D; 1, flags will _not_ include their list of prerequisites, targets or rules.  Set summary&#x3D;0 to include these fields for each flag returned | [optional] |
| **filter** | **String** | A comma-separated list of filters. Each filter is of the form field:value. Read the endpoint description for a full list of available filter fields. | [optional] |
| **sort** | **String** | A comma-separated list of fields to sort by. Fields prefixed by a dash ( - ) sort in descending order. Read the endpoint description for a full list of available sort fields. | [optional] |
| **compare** | **Boolean** | A boolean to filter results by only flags that have differences between environments | [optional] |

### Return type

[**FeatureFlags**](FeatureFlags.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_expiring_targets

> <ExpiringTargetPatchResponse> patch_expiring_targets(project_key, environment_key, feature_flag_key, patch_flags_request)

Update expiring context targets on feature flag

Schedule a context for removal from individual targeting on a feature flag. The flag must already individually target the context.  You can add, update, or remove a scheduled removal date. You can only schedule a context for removal on a single variation per flag.  This request only supports semantic patches. To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).  ### Instructions  #### addExpiringTarget  Adds a date and time that LaunchDarkly will remove the context from the flag's individual targeting.  ##### Parameters  * `value`: The time, in Unix milliseconds, when LaunchDarkly should remove the context from individual targeting for this flag * `variationId`: The version of the flag variation to update. You can retrieve this by making a GET request for the flag * `contextKey`: The context key for the context to remove from individual targeting * `contextKind`: The kind of context represented by the `contextKey`  #### updateExpiringTarget  Updates the date and time that LaunchDarkly will remove the context from the flag's individual targeting  ##### Parameters  * `value`: The time, in Unix milliseconds, when LaunchDarkly should remove the context from individual targeting for this flag * `variationId`: The version of the flag variation to update. You can retrieve this by making a GET request for the flag. * `contextKey`: The context key for the context to remove from individual targeting * `contextKind`: The kind of context represented by the `contextKey`  #### removeExpiringTarget  Removes the scheduled removal of the context from the flag's individual targeting. The context will remain part of the flag's individual targeting until you explicitly remove them, or until you schedule another removal.  ##### Parameters  * `variationId`: The version of the flag variation to update. You can retrieve this by making a GET request for the flag. * `contextKey`: The context key for the context to remove from individual targeting * `contextKind`: The kind of context represented by the `contextKey` 

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
patch_flags_request = LaunchDarklyApi::PatchFlagsRequest.new({instructions: [{"kind": "addExpireUserTargetDate", "userKey": "sandy", "value": 1686412800000, "variationId": "ce12d345-a1b2-4fb5-a123-ab123d4d5f5d"}]}) # PatchFlagsRequest | 

begin
  # Update expiring context targets on feature flag
  result = api_instance.patch_expiring_targets(project_key, environment_key, feature_flag_key, patch_flags_request)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->patch_expiring_targets: #{e}"
end
```

#### Using the patch_expiring_targets_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExpiringTargetPatchResponse>, Integer, Hash)> patch_expiring_targets_with_http_info(project_key, environment_key, feature_flag_key, patch_flags_request)

```ruby
begin
  # Update expiring context targets on feature flag
  data, status_code, headers = api_instance.patch_expiring_targets_with_http_info(project_key, environment_key, feature_flag_key, patch_flags_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExpiringTargetPatchResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->patch_expiring_targets_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **patch_flags_request** | [**PatchFlagsRequest**](PatchFlagsRequest.md) |  |  |

### Return type

[**ExpiringTargetPatchResponse**](ExpiringTargetPatchResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## patch_expiring_user_targets

> <ExpiringUserTargetPatchResponse> patch_expiring_user_targets(project_key, environment_key, feature_flag_key, patch_flags_request)

Update expiring user targets on feature flag

> ### Contexts are now available > > After you have upgraded your LaunchDarkly SDK to use contexts instead of users, you should use [Update expiring context targets on feature flag](/tag/Feature-flags#operation/patchExpiringTargets) instead of this endpoint. To learn more, read [Contexts](https://docs.launchdarkly.com/home/contexts).  Schedule a target for removal from individual targeting on a feature flag. The flag must already serve a variation to specific targets based on their key.  You can add, update, or remove a scheduled removal date. You can only schedule a target for removal on a single variation per flag.  This request only supports semantic patches. To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).  ### Instructions  #### addExpireUserTargetDate  Adds a date and time that LaunchDarkly will remove the user from the flag's individual targeting.  ##### Parameters  * `value`: The time, in Unix milliseconds, when LaunchDarkly should remove the user from individual targeting for this flag * `variationId`: The version of the flag variation to update. You can retrieve this by making a GET request for the flag. * `userKey`: The user key for the user to remove from individual targeting  #### updateExpireUserTargetDate  Updates the date and time that LaunchDarkly will remove the user from the flag's individual targeting.  ##### Parameters  * `value`: The time, in Unix milliseconds, when LaunchDarkly should remove the user from individual targeting for this flag * `variationId`: The version of the flag variation to update. You can retrieve this by making a GET request for the flag. * `userKey`: The user key for the user to remove from individual targeting  #### removeExpireUserTargetDate  Removes the scheduled removal of the user from the flag's individual targeting. The user will remain part of the flag's individual targeting until you explicitly remove them, or until you schedule another removal.  ##### Parameters  * `variationId`: The version of the flag variation to update. You can retrieve this by making a GET request for the flag. * `userKey`: The user key for the user to remove from individual targeting 

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
patch_flags_request = LaunchDarklyApi::PatchFlagsRequest.new({instructions: [{"kind": "addExpireUserTargetDate", "userKey": "sandy", "value": 1686412800000, "variationId": "ce12d345-a1b2-4fb5-a123-ab123d4d5f5d"}]}) # PatchFlagsRequest | 

begin
  # Update expiring user targets on feature flag
  result = api_instance.patch_expiring_user_targets(project_key, environment_key, feature_flag_key, patch_flags_request)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->patch_expiring_user_targets: #{e}"
end
```

#### Using the patch_expiring_user_targets_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExpiringUserTargetPatchResponse>, Integer, Hash)> patch_expiring_user_targets_with_http_info(project_key, environment_key, feature_flag_key, patch_flags_request)

```ruby
begin
  # Update expiring user targets on feature flag
  data, status_code, headers = api_instance.patch_expiring_user_targets_with_http_info(project_key, environment_key, feature_flag_key, patch_flags_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExpiringUserTargetPatchResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->patch_expiring_user_targets_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **patch_flags_request** | [**PatchFlagsRequest**](PatchFlagsRequest.md) |  |  |

### Return type

[**ExpiringUserTargetPatchResponse**](ExpiringUserTargetPatchResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## patch_feature_flag

> <FeatureFlag> patch_feature_flag(project_key, feature_flag_key, patch_with_comment)

Update feature flag

Perform a partial update to a feature flag. The request body must be a valid semantic patch or JSON patch.  ### Using semantic patches on a feature flag  To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).  The body of a semantic patch request for updating feature flags requires an `environmentKey` in addition to `instructions` and an optional `comment`. The body of the request takes the following properties:  * `comment` (string): (Optional) A description of the update. * `environmentKey` (string): (Required) The key of the LaunchDarkly environment. * `instructions` (array): (Required) A list of actions the update should perform. Each action in the list must be an object with a `kind` property that indicates the instruction. If the action requires parameters, you must include those parameters as additional fields in the object. The body of a single semantic patch can contain many different instructions.  ### Instructions  Semantic patch requests support the following `kind` instructions for updating feature flags.  <details> <summary>Click to expand instructions for turning flags on and off</summary>  #### turnFlagOff  Sets the flag's targeting state to **Off**.  Use this request body:  ```json {   \"environmentKey\": \"example-environment-key\",   \"instructions\": [ { \"kind\": \"turnFlagOff\" } ] } ```  #### turnFlagOn  Sets the flag's targeting state to **On**.  Use this request body:  ```json {   \"environmentKey\": \"example-environment-key\",   \"instructions\": [ { \"kind\": \"turnFlagOn\" } ] } ```  </details><br />  <details> <summary>Click to expand instructions for working with targeting and variations</summary>  Several of the instructions for working with targeting and variations require flag rule IDs, variation IDs, or clause IDs as parameters. Each of these are returned as part of the [Get feature flag](/tag/Feature-flags#operation/getFeatureFlag) response. The flag rule ID is the `_id` field of each element in the `rules` array within each environment listed in the `environments` object. The variation ID is the `_id` field in each element of the `variations` array. The clause ID is the `_id` field of each element of the `clauses` array within the `rules` array within each environment listed in the `environments` object.  #### addClauses  Adds the given clauses to the rule indicated by `ruleId`.  ##### Parameters  - `ruleId`: ID of a rule in the flag. - `clauses`: Array of clause objects, with `contextKind` (string), `attribute` (string), `op` (string), `negate` (boolean), and `values` (array of strings, numbers, or dates) properties.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"addClauses\",   \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\",   \"clauses\": [{    \"contextKind\": \"user\",    \"attribute\": \"country\",    \"op\": \"in\",    \"negate\": false,    \"values\": [\"USA\", \"Canada\"]   }]  }] } ```  #### addPrerequisite  Adds the flag indicated by `key` with variation `variationId` as a prerequisite to the flag in the path parameter.  ##### Parameters  - `key`: Flag key of the prerequisite flag. - `variationId`: ID of a variation of the prerequisite flag.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"addPrerequisite\",   \"key\": \"example-prereq-flag-key\",   \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\"  }] } ```  #### addRule  Adds a new targeting rule to the flag. The rule may contain `clauses` and serve the variation that `variationId` indicates, or serve a percentage rollout that `rolloutWeights`, `rolloutBucketBy`, and `rolloutContextKind` indicate.  If you set `beforeRuleId`, this adds the new rule before the indicated rule. Otherwise, adds the new rule to the end of the list.  ##### Parameters  - `clauses`: Array of clause objects, with `contextKind` (string), `attribute` (string), `op` (string), `negate` (boolean), and `values` (array of strings, numbers, or dates) properties. - `beforeRuleId`: (Optional) ID of a flag rule. - `variationId`: ID of a variation of the flag. - `rolloutWeights`: (Optional) Map of `variationId` to weight, in thousandths of a percent (0-100000). - `rolloutBucketBy`: (Optional) Context attribute available in the specified `rolloutContextKind`. - `rolloutContextKind`: (Optional) Context kind, defaults to `user`  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [{     \"kind\": \"addRule\",     \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\",     \"clauses\": [{       \"contextKind\": \"organization\",       \"attribute\": \"located_in\",       \"op\": \"in\",       \"negate\": false,       \"values\": [\"Sweden\", \"Norway\"]     }]   }] } ```  #### addTargets  Adds context keys to the individual context targets for the context kind that `contextKind` specifies and the variation that `variationId` specifies. Returns an error if this causes the flag to target the same context key in multiple variations.  ##### Parameters  - `values`: List of context keys. - `contextKind`: (Optional) Context kind to target, defaults to `user` - `variationId`: ID of a variation on the flag.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"addTargets\",   \"values\": [\"context-key-123abc\", \"context-key-456def\"],   \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\"  }] } ```  #### addUserTargets  Adds user keys to the individual user targets for the variation that `variationId` specifies. Returns an error if this causes the flag to target the same user key in multiple variations.  ##### Parameters  - `values`: List of user keys. - `variationId`: ID of a variation on the flag.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"addUserTargets\",   \"values\": [\"user-key-123abc\", \"user-key-456def\"],   \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\"  }] } ```  #### addValuesToClause  Adds `values` to the values of the clause that `ruleId` and `clauseId` indicate. Does not update the context kind, attribute, or operator.  ##### Parameters  - `ruleId`: ID of a rule in the flag. - `clauseId`: ID of a clause in that rule. - `values`: Array of strings.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"addValuesToClause\",   \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\",   \"clauseId\": \"10a58772-3121-400f-846b-b8a04e8944ed\",   \"values\": [\"beta_testers\"]  }] } ```  #### clearTargets  Removes all individual targets from the variation that `variationId` specifies. This includes both user and non-user targets.  ##### Parameters  - `variationId`: ID of a variation on the flag.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"clearTargets\", \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\" } ] } ```  #### clearUserTargets  Removes all individual user targets from the variation that `variationId` specifies.  ##### Parameters  - `variationId`: ID of a variation on the flag.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"clearUserTargets\", \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\" } ] } ```  #### removeClauses  Removes the clauses specified by `clauseIds` from the rule indicated by `ruleId`.  ##### Parameters  - `ruleId`: ID of a rule in the flag. - `clauseIds`: Array of IDs of clauses in the rule.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"removeClauses\",   \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\",   \"clauseIds\": [\"10a58772-3121-400f-846b-b8a04e8944ed\", \"36a461dc-235e-4b08-97b9-73ce9365873e\"]  }] } ```  #### removePrerequisite  Removes the prerequisite flag indicated by `key`. Does nothing if this prerequisite does not exist.  ##### Parameters  - `key`: Flag key of an existing prerequisite flag.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"removePrerequisite\", \"key\": \"prereq-flag-key-123abc\" } ] } ```  #### removeRule  Removes the targeting rule specified by `ruleId`. Does nothing if the rule does not exist.  ##### Parameters  - `ruleId`: ID of a rule in the flag.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"removeRule\", \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\" } ] } ```  #### removeTargets  Removes context keys from the individual context targets for the context kind that `contextKind` specifies and the variation that `variationId` specifies. Does nothing if the flag does not target the context keys.  ##### Parameters  - `values`: List of context keys. - `contextKind`: (Optional) Context kind to target, defaults to `user` - `variationId`: ID of a flag variation.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"removeTargets\",   \"values\": [\"context-key-123abc\", \"context-key-456def\"],   \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\"  }] } ```  #### removeUserTargets  Removes user keys from the individual user targets for the variation that `variationId` specifies. Does nothing if the flag does not target the user keys.  ##### Parameters  - `values`: List of user keys. - `variationId`: ID of a flag variation.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"removeUserTargets\",   \"values\": [\"user-key-123abc\", \"user-key-456def\"],   \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\"  }] } ```  #### removeValuesFromClause  Removes `values` from the values of the clause indicated by `ruleId` and `clauseId`. Does not update the context kind, attribute, or operator.  ##### Parameters  - `ruleId`: ID of a rule in the flag. - `clauseId`: ID of a clause in that rule. - `values`: Array of strings.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"removeValuesFromClause\",   \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\",   \"clauseId\": \"10a58772-3121-400f-846b-b8a04e8944ed\",   \"values\": [\"beta_testers\"]  }] } ```  #### reorderRules  Rearranges the rules to match the order given in `ruleIds`. Returns an error if `ruleIds` does not match the current set of rules on the flag.  ##### Parameters  - `ruleIds`: Array of IDs of all rules in the flag.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"reorderRules\",   \"ruleIds\": [\"a902ef4a-2faf-4eaf-88e1-ecc356708a29\", \"63c238d1-835d-435e-8f21-c8d5e40b2a3d\"]  }] } ```  #### replacePrerequisites  Removes all existing prerequisites and replaces them with the list you provide.  ##### Parameters  - `prerequisites`: A list of prerequisites. Each item in the list must include a flag `key` and `variationId`.  Use this request body:  ```json {   \"environmentKey\": \"example-environment-key\",   \"instructions\": [     {       \"kind\": \"replacePrerequisites\",       \"prerequisites\": [         {           \"key\": \"prereq-flag-key\",           \"variationId\": \"10a58772-3121-400f-846b-b8a04e8944ed\"         },         {           \"key\": \"another-prereq-flag-key\",           \"variationId\": \"e5830889-1ec5-4b0c-9cc9-c48790090c43\"         }       ]     }   ] } ```  #### replaceRules  Removes all targeting rules for the flag and replaces them with the list you provide.  ##### Parameters  - `rules`: A list of rules.  Use this request body:  ```json {   \"environmentKey\": \"example-environment-key\",   \"instructions\": [     {       \"kind\": \"replaceRules\",       \"rules\": [         {           \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\",           \"description\": \"My new rule\",           \"clauses\": [             {               \"contextKind\": \"user\",               \"attribute\": \"segmentMatch\",               \"op\": \"segmentMatch\",               \"values\": [\"test\"]             }           ],           \"trackEvents\": true         }       ]     }   ] } ```  #### replaceTargets  Removes all existing targeting and replaces it with the list of targets you provide.  ##### Parameters  - `targets`: A list of context targeting. Each item in the list includes an optional `contextKind` that defaults to `user`, a required `variationId`, and a required list of `values`.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [     {       \"kind\": \"replaceTargets\",       \"targets\": [         {           \"contextKind\": \"user\",           \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\",           \"values\": [\"user-key-123abc\"]         },         {           \"contextKind\": \"device\",           \"variationId\": \"e5830889-1ec5-4b0c-9cc9-c48790090c43\",           \"values\": [\"device-key-456def\"]         }       ]     }       ] } ```  #### replaceUserTargets  Removes all existing user targeting and replaces it with the list of targets you provide. In the list of targets, you must include a target for each of the flag's variations.  ##### Parameters  - `targets`: A list of user targeting. Each item in the list must include a `variationId` and a list of `values`.  Use this request body:  ```json {   \"environmentKey\": \"example-environment-key\",   \"instructions\": [     {       \"kind\": \"replaceUserTargets\",       \"targets\": [         {           \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\",           \"values\": [\"user-key-123abc\", \"user-key-456def\"]         },         {           \"variationId\": \"e5830889-1ec5-4b0c-9cc9-c48790090c43\",           \"values\": [\"user-key-789ghi\"]         }       ]     }   ] } ```  #### updateClause  Replaces the clause indicated by `ruleId` and `clauseId` with `clause`.  ##### Parameters  - `ruleId`: ID of a rule in the flag. - `clauseId`: ID of a clause in that rule. - `clause`: New `clause` object, with `contextKind` (string), `attribute` (string), `op` (string), `negate` (boolean), and `values` (array of strings, numbers, or dates) properties.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [{     \"kind\": \"updateClause\",     \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\",     \"clauseId\": \"10c7462a-2062-45ba-a8bb-dfb3de0f8af5\",     \"clause\": {       \"contextKind\": \"user\",       \"attribute\": \"country\",       \"op\": \"in\",       \"negate\": false,       \"values\": [\"Mexico\", \"Canada\"]     }   }] } ```  #### updateFallthroughVariationOrRollout  Updates the default or \"fallthrough\" rule for the flag, which the flag serves when a context matches none of the targeting rules. The rule can serve either the variation that `variationId` indicates, or a percent rollout that `rolloutWeights` and `rolloutBucketBy` indicate.  ##### Parameters  - `variationId`: ID of a variation of the flag. or - `rolloutWeights`: Map of `variationId` to weight, in thousandths of a percent (0-100000). - `rolloutBucketBy`: (Optional) Context attribute available in the specified `rolloutContextKind`. - `rolloutContextKind`: (Optional) Context kind, defaults to `user`  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"updateFallthroughVariationOrRollout\",   \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\"  }] } ```  #### updateOffVariation  Updates the default off variation to `variationId`. The flag serves the default off variation when the flag's targeting is **Off**.  ##### Parameters  - `variationId`: ID of a variation of the flag.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"updateOffVariation\", \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\" } ] } ```  #### updatePrerequisite  Changes the prerequisite flag that `key` indicates to use the variation that `variationId` indicates. Returns an error if this prerequisite does not exist.  ##### Parameters  - `key`: Flag key of an existing prerequisite flag. - `variationId`: ID of a variation of the prerequisite flag.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"updatePrerequisite\",   \"key\": \"example-prereq-flag-key\",   \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\"  }] } ```  #### updateRuleDescription  Updates the description of the feature flag rule.  ##### Parameters  - `description`: The new human-readable description for this rule. - `ruleId`: The ID of the rule. You can retrieve this by making a GET request for the flag.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"updateRuleDescription\",   \"description\": \"New rule description\",   \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\"  }] } ```  #### updateRuleTrackEvents  Updates whether or not LaunchDarkly tracks events for the feature flag associated with this rule.  ##### Parameters  - `ruleId`: The ID of the rule. You can retrieve this by making a GET request for the flag. - `trackEvents`: Whether or not events are tracked.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"updateRuleTrackEvents\",   \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\",   \"trackEvents\": true  }] } ```  #### updateRuleVariationOrRollout  Updates what `ruleId` serves when its clauses evaluate to true. The rule can serve either the variation that `variationId` indicates, or a percent rollout that `rolloutWeights` and `rolloutBucketBy` indicate.  ##### Parameters  - `ruleId`: ID of a rule in the flag. - `variationId`: ID of a variation of the flag.    or  - `rolloutWeights`: Map of `variationId` to weight, in thousandths of a percent (0-100000). - `rolloutBucketBy`: (Optional) Context attribute available in the specified `rolloutContextKind`. - `rolloutContextKind`: (Optional) Context kind, defaults to `user`  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"updateRuleVariationOrRollout\",   \"ruleId\": \"a902ef4a-2faf-4eaf-88e1-ecc356708a29\",   \"variationId\": \"2f43f67c-3e4e-4945-a18a-26559378ca00\"  }] } ```  #### updateTrackEvents  Updates whether or not LaunchDarkly tracks events for the feature flag, for all rules.  ##### Parameters  - `trackEvents`: Whether or not events are tracked.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"updateTrackEvents\", \"trackEvents\": true } ] } ```  #### updateTrackEventsFallthrough  Updates whether or not LaunchDarkly tracks events for the feature flag, for the default rule.  ##### Parameters  - `trackEvents`: Whether or not events are tracked.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"updateTrackEventsFallthrough\", \"trackEvents\": true } ] } ```  </details><br />  <details> <summary>Click to expand instructions for updating flag settings</summary>  #### addCustomProperties  Adds a new custom property to the feature flag. Custom properties are used to associate feature flags with LaunchDarkly integrations. For example, if you create an integration with an issue tracking service, you may want to associate a flag with a list of issues related to a feature's development.  ##### Parameters   - `key`: The custom property key.  - `name`: The custom property name.  - `values`: A list of the associated values for the custom property.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"addCustomProperties\",   \"key\": \"example-custom-property\",   \"name\": \"Example custom property\",   \"values\": [\"value1\", \"value2\"]  }] } ```  #### addTags  Adds tags to the feature flag.  ##### Parameters  - `values`: A list of tags to add.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"addTags\", \"values\": [\"tag1\", \"tag2\"] } ] } ```  #### makeFlagPermanent  Marks the feature flag as permanent. LaunchDarkly does not prompt you to remove permanent flags, even if one variation is rolled out to all your customers.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"makeFlagPermanent\" } ] } ```  #### makeFlagTemporary  Marks the feature flag as temporary.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"makeFlagTemporary\" } ] } ```  #### removeCustomProperties  Removes the associated values from a custom property. If all the associated values are removed, this instruction also removes the custom property.  ##### Parameters   - `key`: The custom property key.  - `values`: A list of the associated values to remove from the custom property.  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{   \"kind\": \"replaceCustomProperties\",   \"key\": \"example-custom-property\",   \"values\": [\"value1\", \"value2\"]  }] } ```  #### removeMaintainer  Removes the flag's maintainer. To set a new maintainer, use the flag's **Settings** tab in the LaunchDarkly user interface.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"removeMaintainer\" } ] } ```  #### removeTags  Removes tags from the feature flag.  ##### Parameters  - `values`: A list of tags to remove.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"removeTags\", \"values\": [\"tag1\", \"tag2\"] } ] } ```  #### replaceCustomProperties  Replaces the existing associated values for a custom property with the new values.  ##### Parameters   - `key`: The custom property key.  - `name`: The custom property name.  - `values`: A list of the new associated values for the custom property.  Use this request body:  ```json {  \"environmentKey\": \"environment-key-123abc\",  \"instructions\": [{    \"kind\": \"replaceCustomProperties\",    \"key\": \"example-custom-property\",    \"name\": \"Example custom property\",    \"values\": [\"value1\", \"value2\"]  }] } ```  #### turnOffClientSideAvailability  Turns off client-side SDK availability for the flag. This is equivalent to unchecking the **SDKs using Mobile Key** and/or **SDKs using client-side ID** boxes for the flag. If you're using a client-side or mobile SDK, you must expose your feature flags in order for the client-side or mobile SDKs to evaluate them.  ##### Parameters  - `value`: Use \"usingMobileKey\" to turn off availability for mobile SDKs. Use \"usingEnvironmentId\" to turn on availability for client-side SDKs.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"turnOffClientSideAvailability\", \"value\": \"usingMobileKey\" } ] } ```  #### turnOnClientSideAvailability  Turns on client-side SDK availability for the flag. This is equivalent to unchecking the **SDKs using Mobile Key** and/or **SDKs using client-side ID** boxes for the flag. If you're using a client-side or mobile SDK, you must expose your feature flags in order for the client-side or mobile SDKs to evaluate them.  ##### Parameters  - `value`: Use \"usingMobileKey\" to turn on availability for mobile SDKs. Use \"usingEnvironmentId\" to turn on availability for client-side SDKs.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"turnOnClientSideAvailability\", \"value\": \"usingMobileKey\" } ] } ```  #### updateDescription  Updates the feature flag description.  ##### Parameters  - `value`: The new description.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"updateDescription\", \"value\": \"Updated flag description\" } ] } ``` #### updateMaintainerMember  Updates the maintainer of the flag to an existing member and removes the existing maintainer.  ##### Parameters  - `value`: The ID of the member.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"updateMaintainerMember\", \"value\": \"61e9b714fd47591727db558a\" } ] } ```  #### updateMaintainerTeam  Updates the maintainer of the flag to an existing team and removes the existing maintainer.  ##### Parameters  - `value`: The key of the team.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"updateMaintainerTeam\", \"value\": \"example-team-key\" } ] } ```  #### updateName  Updates the feature flag name.  ##### Parameters  - `value`: The new name.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"updateName\", \"value\": \"Updated flag name\" } ] } ```  </details><br />  <details> <summary>Click to expand instructions for updating the flag lifecycle</summary>  #### archiveFlag  Archives the feature flag. This retires it from LaunchDarkly without deleting it. You cannot archive a flag that is a prerequisite of other flags.  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"archiveFlag\" } ] } ```  #### deleteFlag  Deletes the feature flag and its rules. You cannot restore a deleted flag. If this flag is requested again, the flag value defined in code will be returned for all contexts.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"deleteFlag\" } ] } ```  #### restoreFlag  Restores the feature flag if it was previously archived.  Use this request body:  ```json {   \"environmentKey\": \"environment-key-123abc\",   \"instructions\": [ { \"kind\": \"restoreFlag\" } ] } ```  </details>  ### Using JSON Patches on a feature flag If you do not include the header described above, you can use [JSON patch](/reference#updates-using-json-patch).  When using the update feature flag endpoint to add individual targets to a specific variation, there are two different patch documents, depending on whether there are already individual targets for the variation.  If a flag variation already has individual targets, the path for the JSON Patch operation is:  ```json {   \"op\": \"add\",   \"path\": \"/environments/devint/targets/0/values/-\",   \"value\": \"TestClient10\" } ```  If a flag variation does not already have individual targets, the path for the JSON Patch operation is:  ```json [   {     \"op\": \"add\",     \"path\": \"/environments/devint/targets/-\",     \"value\": { \"variation\": 0, \"values\": [\"TestClient10\"] }   } ] ```   ### Required approvals If a request attempts to alter a flag configuration in an environment where approvals are required for the flag, the request will fail with a 405. Changes to the flag configuration in that environment will require creating an [approval request](/tag/Approvals) or a [workflow](/tag/Workflows-(beta)).  ### Conflicts If a flag configuration change made through this endpoint would cause a pending scheduled change or approval request to fail, this endpoint will return a 400. You can ignore this check by adding an `ignoreConflicts` query parameter set to `true`. 

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key. The key identifies the flag in your code.
patch_with_comment = LaunchDarklyApi::PatchWithComment.new({patch: [LaunchDarklyApi::PatchOperation.new({op: 'replace', path: '/exampleField', value: new example value})]}) # PatchWithComment | 

begin
  # Update feature flag
  result = api_instance.patch_feature_flag(project_key, feature_flag_key, patch_with_comment)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->patch_feature_flag: #{e}"
end
```

#### Using the patch_feature_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlag>, Integer, Hash)> patch_feature_flag_with_http_info(project_key, feature_flag_key, patch_with_comment)

```ruby
begin
  # Update feature flag
  data, status_code, headers = api_instance.patch_feature_flag_with_http_info(project_key, feature_flag_key, patch_with_comment)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlag>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->patch_feature_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key. The key identifies the flag in your code. |  |
| **patch_with_comment** | [**PatchWithComment**](PatchWithComment.md) |  |  |

### Return type

[**FeatureFlag**](FeatureFlag.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_feature_flag

> <FeatureFlag> post_feature_flag(project_key, feature_flag_body, opts)

Create a feature flag

Create a feature flag with the given name, key, and variations.

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

api_instance = LaunchDarklyApi::FeatureFlagsApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_body = LaunchDarklyApi::FeatureFlagBody.new({name: 'My flag', key: 'my-flag'}) # FeatureFlagBody | 
opts = {
  clone: 'clone_example' # String | The key of the feature flag to be cloned. The key identifies the flag in your code. For example, setting `clone=flagKey` copies the full targeting configuration for all environments, including `on/off` state, from the original flag to the new flag.
}

begin
  # Create a feature flag
  result = api_instance.post_feature_flag(project_key, feature_flag_body, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->post_feature_flag: #{e}"
end
```

#### Using the post_feature_flag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FeatureFlag>, Integer, Hash)> post_feature_flag_with_http_info(project_key, feature_flag_body, opts)

```ruby
begin
  # Create a feature flag
  data, status_code, headers = api_instance.post_feature_flag_with_http_info(project_key, feature_flag_body, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FeatureFlag>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling FeatureFlagsApi->post_feature_flag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_body** | [**FeatureFlagBody**](FeatureFlagBody.md) |  |  |
| **clone** | **String** | The key of the feature flag to be cloned. The key identifies the flag in your code. For example, setting &#x60;clone&#x3D;flagKey&#x60; copies the full targeting configuration for all environments, including &#x60;on/off&#x60; state, from the original flag to the new flag. | [optional] |

### Return type

[**FeatureFlag**](FeatureFlag.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

