# LaunchDarklyApi::ProjectsApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_project**](ProjectsApi.md#delete_project) | **DELETE** /api/v2/projects/{projectKey} | Delete project |
| [**get_flag_defaults_by_project**](ProjectsApi.md#get_flag_defaults_by_project) | **GET** /api/v2/projects/{projectKey}/flag-defaults | Get flag defaults for project |
| [**get_project**](ProjectsApi.md#get_project) | **GET** /api/v2/projects/{projectKey} | Get project |
| [**get_projects**](ProjectsApi.md#get_projects) | **GET** /api/v2/projects | List projects |
| [**patch_flag_defaults_by_project**](ProjectsApi.md#patch_flag_defaults_by_project) | **PATCH** /api/v2/projects/{projectKey}/flag-defaults | Update flag default for project |
| [**patch_project**](ProjectsApi.md#patch_project) | **PATCH** /api/v2/projects/{projectKey} | Update project |
| [**post_project**](ProjectsApi.md#post_project) | **POST** /api/v2/projects | Create project |
| [**put_flag_defaults_by_project**](ProjectsApi.md#put_flag_defaults_by_project) | **PUT** /api/v2/projects/{projectKey}/flag-defaults | Create or update flag defaults for project |


## delete_project

> delete_project(project_key)

Delete project

Delete a project by key. Use this endpoint with caution. Deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.

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

api_instance = LaunchDarklyApi::ProjectsApi.new
project_key = 'project_key_example' # String | The project key

begin
  # Delete project
  api_instance.delete_project(project_key)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->delete_project: #{e}"
end
```

#### Using the delete_project_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_project_with_http_info(project_key)

```ruby
begin
  # Delete project
  data, status_code, headers = api_instance.delete_project_with_http_info(project_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->delete_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_flag_defaults_by_project

> <FlagDefaultsRep> get_flag_defaults_by_project(project_key)

Get flag defaults for project

Get the flag defaults for a specific project.

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

api_instance = LaunchDarklyApi::ProjectsApi.new
project_key = 'project_key_example' # String | The project key

begin
  # Get flag defaults for project
  result = api_instance.get_flag_defaults_by_project(project_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->get_flag_defaults_by_project: #{e}"
end
```

#### Using the get_flag_defaults_by_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FlagDefaultsRep>, Integer, Hash)> get_flag_defaults_by_project_with_http_info(project_key)

```ruby
begin
  # Get flag defaults for project
  data, status_code, headers = api_instance.get_flag_defaults_by_project_with_http_info(project_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FlagDefaultsRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->get_flag_defaults_by_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |

### Return type

[**FlagDefaultsRep**](FlagDefaultsRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_project

> <Project> get_project(project_key, opts)

Get project

Get a single project by key.

### Expanding the project response  LaunchDarkly supports one field for expanding the \"Get project\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with any of the following fields: * `environments` includes a paginated list of the project environments.  For example, `expand=environments` includes the `environments` field for the project in the response. 

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

api_instance = LaunchDarklyApi::ProjectsApi.new
project_key = 'project_key_example' # String | The project key.
opts = {
  expand: 'expand_example' # String | A comma-separated list of properties that can reveal additional information in the response.
}

begin
  # Get project
  result = api_instance.get_project(project_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->get_project: #{e}"
end
```

#### Using the get_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Project>, Integer, Hash)> get_project_with_http_info(project_key, opts)

```ruby
begin
  # Get project
  data, status_code, headers = api_instance.get_project_with_http_info(project_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Project>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->get_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key. |  |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. | [optional] |

### Return type

[**Project**](Project.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_projects

> <Projects> get_projects(opts)

List projects

Return a list of projects.  By default, this returns the first 20 projects. Page through this list with the `limit` parameter and by following the `first`, `prev`, `next`, and `last` links in the `_links` field that returns. If those links do not appear, the pages they refer to don't exist. For example, the `first` and `prev` links will be missing from the response on the first page, because there is no previous page and you cannot return to the first page when you are already on the first page.

### Filtering projects  LaunchDarkly supports two fields for filters: - `query` is a string that matches against the projects' names and keys. It is not case sensitive. - `tags` is a `+` separate list of project tags. It filters the list of projects that have all of the tags in the list.  For example, the filter `query:abc,tags:tag-1+tag-2` matches projects with the string `abc` in their name or key and also are tagged with `tag-1` and `tag-2`. The filter is not case-sensitive.

### Sorting projects  LaunchDarkly supports two fields for sorting: - `name` sorts by project name. - `createdOn` sorts by the creation date of the project.  For example, `sort=name` sorts the response by project name in ascending order.

### Expanding the projects response  LaunchDarkly supports one field for expanding the \"List projects\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with the `environments` field.  `Environments` includes a paginated list of the project environments. * `environments` includes a paginated list of the project environments.  For example, `expand=environments` includes the `environments` field for each project in the response. 

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

api_instance = LaunchDarklyApi::ProjectsApi.new
opts = {
  limit: 789, # Integer | The number of projects to return in the response. Defaults to 20.
  offset: 789, # Integer | Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and returns the next `limit` items.
  filter: 'filter_example', # String | A comma-separated list of filters. Each filter is constructed as `field:value`.
  sort: 'sort_example', # String | A comma-separated list of fields to sort by. Fields prefixed by a dash ( - ) sort in descending order.
  expand: 'expand_example' # String | A comma-separated list of properties that can reveal additional information in the response.
}

begin
  # List projects
  result = api_instance.get_projects(opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->get_projects: #{e}"
end
```

#### Using the get_projects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Projects>, Integer, Hash)> get_projects_with_http_info(opts)

```ruby
begin
  # List projects
  data, status_code, headers = api_instance.get_projects_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Projects>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->get_projects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | The number of projects to return in the response. Defaults to 20. | [optional] |
| **offset** | **Integer** | Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and returns the next &#x60;limit&#x60; items. | [optional] |
| **filter** | **String** | A comma-separated list of filters. Each filter is constructed as &#x60;field:value&#x60;. | [optional] |
| **sort** | **String** | A comma-separated list of fields to sort by. Fields prefixed by a dash ( - ) sort in descending order. | [optional] |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. | [optional] |

### Return type

[**Projects**](Projects.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_flag_defaults_by_project

> <UpsertPayloadRep> patch_flag_defaults_by_project(project_key, patch_operation)

Update flag default for project

Update a flag default. Requires a [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902) representation of the desired changes to the flag default.

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

api_instance = LaunchDarklyApi::ProjectsApi.new
project_key = 'project_key_example' # String | The project key
patch_operation = [LaunchDarklyApi::PatchOperation.new({op: 'replace', path: '/exampleField', value: new example value})] # Array<PatchOperation> | 

begin
  # Update flag default for project
  result = api_instance.patch_flag_defaults_by_project(project_key, patch_operation)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->patch_flag_defaults_by_project: #{e}"
end
```

#### Using the patch_flag_defaults_by_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpsertPayloadRep>, Integer, Hash)> patch_flag_defaults_by_project_with_http_info(project_key, patch_operation)

```ruby
begin
  # Update flag default for project
  data, status_code, headers = api_instance.patch_flag_defaults_by_project_with_http_info(project_key, patch_operation)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpsertPayloadRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->patch_flag_defaults_by_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **patch_operation** | [**Array&lt;PatchOperation&gt;**](PatchOperation.md) |  |  |

### Return type

[**UpsertPayloadRep**](UpsertPayloadRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## patch_project

> <ProjectRep> patch_project(project_key, patch_operation)

Update project

Update a project. Requires a [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902) representation of the desired changes to the project.

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

api_instance = LaunchDarklyApi::ProjectsApi.new
project_key = 'project_key_example' # String | The project key
patch_operation = [LaunchDarklyApi::PatchOperation.new({op: 'replace', path: '/exampleField', value: new example value})] # Array<PatchOperation> | 

begin
  # Update project
  result = api_instance.patch_project(project_key, patch_operation)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->patch_project: #{e}"
end
```

#### Using the patch_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProjectRep>, Integer, Hash)> patch_project_with_http_info(project_key, patch_operation)

```ruby
begin
  # Update project
  data, status_code, headers = api_instance.patch_project_with_http_info(project_key, patch_operation)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProjectRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->patch_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **patch_operation** | [**Array&lt;PatchOperation&gt;**](PatchOperation.md) |  |  |

### Return type

[**ProjectRep**](ProjectRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_project

> <ProjectRep> post_project(project_post)

Create project

Create a new project with the given key and name. Project keys must be unique within an account.

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

api_instance = LaunchDarklyApi::ProjectsApi.new
project_post = LaunchDarklyApi::ProjectPost.new({name: 'My Project', key: 'project-key-123abc'}) # ProjectPost | 

begin
  # Create project
  result = api_instance.post_project(project_post)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->post_project: #{e}"
end
```

#### Using the post_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProjectRep>, Integer, Hash)> post_project_with_http_info(project_post)

```ruby
begin
  # Create project
  data, status_code, headers = api_instance.post_project_with_http_info(project_post)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProjectRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->post_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_post** | [**ProjectPost**](ProjectPost.md) |  |  |

### Return type

[**ProjectRep**](ProjectRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## put_flag_defaults_by_project

> <UpsertPayloadRep> put_flag_defaults_by_project(project_key, upsert_flag_defaults_payload)

Create or update flag defaults for project

Create or update flag defaults for a project.

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

api_instance = LaunchDarklyApi::ProjectsApi.new
project_key = 'project_key_example' # String | The project key
upsert_flag_defaults_payload = LaunchDarklyApi::UpsertFlagDefaultsPayload.new({tags: ["tag-1", "tag-2"], temporary: true, default_client_side_availability: LaunchDarklyApi::DefaultClientSideAvailability.new({using_mobile_key: true, using_environment_id: true}), boolean_defaults: LaunchDarklyApi::BooleanFlagDefaults.new({true_display_name: 'True', false_display_name: 'False', true_description: 'serve true', false_description: 'serve false', on_variation: 0, off_variation: 1})}) # UpsertFlagDefaultsPayload | 

begin
  # Create or update flag defaults for project
  result = api_instance.put_flag_defaults_by_project(project_key, upsert_flag_defaults_payload)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->put_flag_defaults_by_project: #{e}"
end
```

#### Using the put_flag_defaults_by_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpsertPayloadRep>, Integer, Hash)> put_flag_defaults_by_project_with_http_info(project_key, upsert_flag_defaults_payload)

```ruby
begin
  # Create or update flag defaults for project
  data, status_code, headers = api_instance.put_flag_defaults_by_project_with_http_info(project_key, upsert_flag_defaults_payload)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpsertPayloadRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ProjectsApi->put_flag_defaults_by_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **upsert_flag_defaults_payload** | [**UpsertFlagDefaultsPayload**](UpsertFlagDefaultsPayload.md) |  |  |

### Return type

[**UpsertPayloadRep**](UpsertPayloadRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

