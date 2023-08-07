# LaunchDarklyApi::DataExportDestinationsApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_destination**](DataExportDestinationsApi.md#delete_destination) | **DELETE** /api/v2/destinations/{projectKey}/{environmentKey}/{id} | Delete Data Export destination |
| [**get_destination**](DataExportDestinationsApi.md#get_destination) | **GET** /api/v2/destinations/{projectKey}/{environmentKey}/{id} | Get destination |
| [**get_destinations**](DataExportDestinationsApi.md#get_destinations) | **GET** /api/v2/destinations | List destinations |
| [**patch_destination**](DataExportDestinationsApi.md#patch_destination) | **PATCH** /api/v2/destinations/{projectKey}/{environmentKey}/{id} | Update Data Export destination |
| [**post_destination**](DataExportDestinationsApi.md#post_destination) | **POST** /api/v2/destinations/{projectKey}/{environmentKey} | Create Data Export destination |


## delete_destination

> delete_destination(project_key, environment_key, id)

Delete Data Export destination

Delete a Data Export destination by ID.

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

api_instance = LaunchDarklyApi::DataExportDestinationsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The Data Export destination ID

begin
  # Delete Data Export destination
  api_instance.delete_destination(project_key, environment_key, id)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->delete_destination: #{e}"
end
```

#### Using the delete_destination_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_destination_with_http_info(project_key, environment_key, id)

```ruby
begin
  # Delete Data Export destination
  data, status_code, headers = api_instance.delete_destination_with_http_info(project_key, environment_key, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->delete_destination_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The Data Export destination ID |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_destination

> <Destination> get_destination(project_key, environment_key, id)

Get destination

Get a single Data Export destination by ID.

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

api_instance = LaunchDarklyApi::DataExportDestinationsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The Data Export destination ID

begin
  # Get destination
  result = api_instance.get_destination(project_key, environment_key, id)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->get_destination: #{e}"
end
```

#### Using the get_destination_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Destination>, Integer, Hash)> get_destination_with_http_info(project_key, environment_key, id)

```ruby
begin
  # Get destination
  data, status_code, headers = api_instance.get_destination_with_http_info(project_key, environment_key, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Destination>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->get_destination_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The Data Export destination ID |  |

### Return type

[**Destination**](Destination.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_destinations

> <Destinations> get_destinations

List destinations

Get a list of Data Export destinations configured across all projects and environments.

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

api_instance = LaunchDarklyApi::DataExportDestinationsApi.new

begin
  # List destinations
  result = api_instance.get_destinations
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->get_destinations: #{e}"
end
```

#### Using the get_destinations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Destinations>, Integer, Hash)> get_destinations_with_http_info

```ruby
begin
  # List destinations
  data, status_code, headers = api_instance.get_destinations_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Destinations>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->get_destinations_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Destinations**](Destinations.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_destination

> <Destination> patch_destination(project_key, environment_key, id, patch_operation)

Update Data Export destination

Update a Data Export destination. This requires a JSON Patch representation of the modified destination.

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

api_instance = LaunchDarklyApi::DataExportDestinationsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
id = 'id_example' # String | The Data Export destination ID
patch_operation = [LaunchDarklyApi::PatchOperation.new({op: 'replace', path: '/exampleField', value: new example value})] # Array<PatchOperation> | 

begin
  # Update Data Export destination
  result = api_instance.patch_destination(project_key, environment_key, id, patch_operation)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->patch_destination: #{e}"
end
```

#### Using the patch_destination_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Destination>, Integer, Hash)> patch_destination_with_http_info(project_key, environment_key, id, patch_operation)

```ruby
begin
  # Update Data Export destination
  data, status_code, headers = api_instance.patch_destination_with_http_info(project_key, environment_key, id, patch_operation)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Destination>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->patch_destination_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **id** | **String** | The Data Export destination ID |  |
| **patch_operation** | [**Array&lt;PatchOperation&gt;**](PatchOperation.md) |  |  |

### Return type

[**Destination**](Destination.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_destination

> <Destination> post_destination(project_key, environment_key, destination_post)

Create Data Export destination

 Create a new Data Export destination.  In the `config` request body parameter, the fields required depend on the type of Data Export destination.  <details> <summary>Click to expand <code>config</code> parameter details</summary>

#### Azure Event Hubs  To create a Data Export destination with a `kind` of `azure-event-hubs`, the `config` object requires the following fields:  * `namespace`: The Event Hub Namespace name * `name`: The Event Hub name * `policyName`: The shared access signature policy name. You can find your policy name in the settings of your Azure Event Hubs Namespace. * `policyKey`: The shared access signature key. You can find your policy key in the settings of your Azure Event Hubs Namespace.

#### Google Cloud Pub/Sub  To create a Data Export destination with a `kind` of `google-pubsub`, the `config` object requires the following fields:  * `project`: The Google PubSub project ID for the project to publish to * `topic`: The Google PubSub topic ID for the topic to publish to

#### Amazon Kinesis  To create a Data Export destination with a `kind` of `kinesis`, the `config` object requires the following fields:  * `region`: The Kinesis stream's AWS region key * `roleArn`: The Amazon Resource Name (ARN) of the AWS role that will be writing to Kinesis * `streamName`: The name of the Kinesis stream that LaunchDarkly is sending events to. This is not the ARN of the stream.

#### mParticle  To create a Data Export destination with a `kind` of `mparticle`, the `config` object requires the following fields:  * `apiKey`: The mParticle API key * `secret`: The mParticle API secret * `userIdentity`: The type of identifier you use to identify your end users in mParticle * `anonymousUserIdentity`: The type of identifier you use to identify your anonymous end users in mParticle

#### Segment  To create a Data Export destination with a `kind` of `segment`, the `config` object requires the following fields:  * `writeKey`: The Segment write key. This is used to authenticate LaunchDarkly's calls to Segment.  </details> 

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

api_instance = LaunchDarklyApi::DataExportDestinationsApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
destination_post = LaunchDarklyApi::DestinationPost.new # DestinationPost | 

begin
  # Create Data Export destination
  result = api_instance.post_destination(project_key, environment_key, destination_post)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->post_destination: #{e}"
end
```

#### Using the post_destination_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Destination>, Integer, Hash)> post_destination_with_http_info(project_key, environment_key, destination_post)

```ruby
begin
  # Create Data Export destination
  data, status_code, headers = api_instance.post_destination_with_http_info(project_key, environment_key, destination_post)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Destination>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling DataExportDestinationsApi->post_destination_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **destination_post** | [**DestinationPost**](DestinationPost.md) |  |  |

### Return type

[**Destination**](Destination.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

