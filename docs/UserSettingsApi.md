# LaunchDarklyApi::UserSettingsApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_expiring_flags_for_user**](UserSettingsApi.md#get_expiring_flags_for_user) | **GET** /api/v2/users/{projectKey}/{userKey}/expiring-user-targets/{environmentKey} | Get expiring dates on flags for user |
| [**get_user_flag_setting**](UserSettingsApi.md#get_user_flag_setting) | **GET** /api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Get flag setting for user |
| [**get_user_flag_settings**](UserSettingsApi.md#get_user_flag_settings) | **GET** /api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags | List flag settings for user |
| [**patch_expiring_flags_for_user**](UserSettingsApi.md#patch_expiring_flags_for_user) | **PATCH** /api/v2/users/{projectKey}/{userKey}/expiring-user-targets/{environmentKey} | Update expiring user target for flags |
| [**put_flag_setting**](UserSettingsApi.md#put_flag_setting) | **PUT** /api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Update flag settings for user |


## get_expiring_flags_for_user

> <ExpiringUserTargetGetResponse> get_expiring_flags_for_user(project_key, user_key, environment_key)

Get expiring dates on flags for user

Get a list of flags for which the given user is scheduled for removal.

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

api_instance = LaunchDarklyApi::UserSettingsApi.new
project_key = 'project_key_example' # String | The project key
user_key = 'user_key_example' # String | The user key
environment_key = 'environment_key_example' # String | The environment key

begin
  # Get expiring dates on flags for user
  result = api_instance.get_expiring_flags_for_user(project_key, user_key, environment_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->get_expiring_flags_for_user: #{e}"
end
```

#### Using the get_expiring_flags_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExpiringUserTargetGetResponse>, Integer, Hash)> get_expiring_flags_for_user_with_http_info(project_key, user_key, environment_key)

```ruby
begin
  # Get expiring dates on flags for user
  data, status_code, headers = api_instance.get_expiring_flags_for_user_with_http_info(project_key, user_key, environment_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExpiringUserTargetGetResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->get_expiring_flags_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **user_key** | **String** | The user key |  |
| **environment_key** | **String** | The environment key |  |

### Return type

[**ExpiringUserTargetGetResponse**](ExpiringUserTargetGetResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_user_flag_setting

> <UserFlagSetting> get_user_flag_setting(project_key, environment_key, user_key, feature_flag_key)

Get flag setting for user

Get a single flag setting for a user by flag key. <br /><br />The `_value` is the flag variation that the user receives. The `setting` indicates whether you've explicitly targeted a user to receive a particular variation. For example, if you have turned off a feature flag for a user, this setting will be `false`. The example response indicates that the user `Abbie_Braun` has the `sort.order` flag enabled.

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

api_instance = LaunchDarklyApi::UserSettingsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
user_key = 'user_key_example' # String | The user key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key

begin
  # Get flag setting for user
  result = api_instance.get_user_flag_setting(project_key, environment_key, user_key, feature_flag_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->get_user_flag_setting: #{e}"
end
```

#### Using the get_user_flag_setting_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserFlagSetting>, Integer, Hash)> get_user_flag_setting_with_http_info(project_key, environment_key, user_key, feature_flag_key)

```ruby
begin
  # Get flag setting for user
  data, status_code, headers = api_instance.get_user_flag_setting_with_http_info(project_key, environment_key, user_key, feature_flag_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserFlagSetting>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->get_user_flag_setting_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **user_key** | **String** | The user key |  |
| **feature_flag_key** | **String** | The feature flag key |  |

### Return type

[**UserFlagSetting**](UserFlagSetting.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_user_flag_settings

> <UserFlagSettings> get_user_flag_settings(project_key, environment_key, user_key)

List flag settings for user

Get the current flag settings for a given user. <br /><br />The `_value` is the flag variation that the user receives. The `setting` indicates whether you've explicitly targeted a user to receive a particular variation. For example, if you have turned off a feature flag for a user, this setting will be `false`. The example response indicates that the user `Abbie_Braun` has the `sort.order` flag enabled and the `alternate.page` flag disabled, and that the user has not been explicitly targeted to receive a particular variation.

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

api_instance = LaunchDarklyApi::UserSettingsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
user_key = 'user_key_example' # String | The user key

begin
  # List flag settings for user
  result = api_instance.get_user_flag_settings(project_key, environment_key, user_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->get_user_flag_settings: #{e}"
end
```

#### Using the get_user_flag_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserFlagSettings>, Integer, Hash)> get_user_flag_settings_with_http_info(project_key, environment_key, user_key)

```ruby
begin
  # List flag settings for user
  data, status_code, headers = api_instance.get_user_flag_settings_with_http_info(project_key, environment_key, user_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserFlagSettings>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->get_user_flag_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **user_key** | **String** | The user key |  |

### Return type

[**UserFlagSettings**](UserFlagSettings.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_expiring_flags_for_user

> <ExpiringUserTargetPatchResponse> patch_expiring_flags_for_user(project_key, user_key, environment_key, patch_users_request)

Update expiring user target for flags

Schedule the specified user for removal from individual targeting on one or more flags. The user must already be individually targeted for each flag.  You can add, update, or remove a scheduled removal date. You can only schedule a user for removal on a single variation per flag.  This request only supports semantic patches. To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).

### Instructions

#### addExpireUserTargetDate  Adds a date and time that LaunchDarkly will remove the user from the flag's individual targeting.

##### Parameters  * `value`: The time, in Unix milliseconds, when LaunchDarkly should remove the user from individual targeting for this flag.

#### updateExpireUserTargetDate  Updates the date and time that LaunchDarkly will remove the user from the flag's individual targeting.

##### Parameters  * `value`: The time, in Unix milliseconds, when LaunchDarkly should remove the user from individual targeting for this flag. * `version`: The version of the flag variation to update. You can retrieve this by making a GET request for the flag.

#### removeExpireUserTargetDate  Removes the scheduled removal of the user from the flag's individual targeting. The user will remain part of the flag's individual targeting until explicitly removed, or until another removal is scheduled. 

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

api_instance = LaunchDarklyApi::UserSettingsApi.new
project_key = 'project_key_example' # String | The project key
user_key = 'user_key_example' # String | The user key
environment_key = 'environment_key_example' # String | The environment key
patch_users_request = LaunchDarklyApi::PatchUsersRequest.new({instructions: [LaunchDarklyApi::InstructionUserRequest.new({kind: 'addExpireUserTargetDate', flag_key: 'sample-flag-key', variation_id: 'ce12d345-a1b2-4fb5-a123-ab123d4d5f5d'})]}) # PatchUsersRequest | 

begin
  # Update expiring user target for flags
  result = api_instance.patch_expiring_flags_for_user(project_key, user_key, environment_key, patch_users_request)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->patch_expiring_flags_for_user: #{e}"
end
```

#### Using the patch_expiring_flags_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExpiringUserTargetPatchResponse>, Integer, Hash)> patch_expiring_flags_for_user_with_http_info(project_key, user_key, environment_key, patch_users_request)

```ruby
begin
  # Update expiring user target for flags
  data, status_code, headers = api_instance.patch_expiring_flags_for_user_with_http_info(project_key, user_key, environment_key, patch_users_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExpiringUserTargetPatchResponse>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->patch_expiring_flags_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **user_key** | **String** | The user key |  |
| **environment_key** | **String** | The environment key |  |
| **patch_users_request** | [**PatchUsersRequest**](PatchUsersRequest.md) |  |  |

### Return type

[**ExpiringUserTargetPatchResponse**](ExpiringUserTargetPatchResponse.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## put_flag_setting

> put_flag_setting(project_key, environment_key, user_key, feature_flag_key, value_put)

Update flag settings for user

Enable or disable a feature flag for a user based on their key.  Omitting the `setting` attribute from the request body, or including a `setting` of `null`, erases the current setting for a user.  If you previously patched the flag, and the patch included the user's data, LaunchDarkly continues to use that data. If LaunchDarkly has never encountered the user's key before, it calculates the flag values based on the user key alone. 

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

api_instance = LaunchDarklyApi::UserSettingsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
user_key = 'user_key_example' # String | The user key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
value_put = LaunchDarklyApi::ValuePut.new # ValuePut | 

begin
  # Update flag settings for user
  api_instance.put_flag_setting(project_key, environment_key, user_key, feature_flag_key, value_put)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->put_flag_setting: #{e}"
end
```

#### Using the put_flag_setting_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> put_flag_setting_with_http_info(project_key, environment_key, user_key, feature_flag_key, value_put)

```ruby
begin
  # Update flag settings for user
  data, status_code, headers = api_instance.put_flag_setting_with_http_info(project_key, environment_key, user_key, feature_flag_key, value_put)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling UserSettingsApi->put_flag_setting_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **user_key** | **String** | The user key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **value_put** | [**ValuePut**](ValuePut.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

