# LaunchDarklyApi::MetricsApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_metric**](MetricsApi.md#delete_metric) | **DELETE** /api/v2/metrics/{projectKey}/{metricKey} | Delete metric |
| [**get_metric**](MetricsApi.md#get_metric) | **GET** /api/v2/metrics/{projectKey}/{metricKey} | Get metric |
| [**get_metrics**](MetricsApi.md#get_metrics) | **GET** /api/v2/metrics/{projectKey} | List metrics |
| [**patch_metric**](MetricsApi.md#patch_metric) | **PATCH** /api/v2/metrics/{projectKey}/{metricKey} | Update metric |
| [**post_metric**](MetricsApi.md#post_metric) | **POST** /api/v2/metrics/{projectKey} | Create metric |


## delete_metric

> delete_metric(project_key, metric_key)

Delete metric

Delete a metric by key.

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

api_instance = LaunchDarklyApi::MetricsApi.new
project_key = 'project_key_example' # String | The project key
metric_key = 'metric_key_example' # String | The metric key

begin
  # Delete metric
  api_instance.delete_metric(project_key, metric_key)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->delete_metric: #{e}"
end
```

#### Using the delete_metric_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_metric_with_http_info(project_key, metric_key)

```ruby
begin
  # Delete metric
  data, status_code, headers = api_instance.delete_metric_with_http_info(project_key, metric_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->delete_metric_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **metric_key** | **String** | The metric key |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_metric

> <MetricRep> get_metric(project_key, metric_key, opts)

Get metric

Get information for a single metric from the specific project.

### Expanding the metric response LaunchDarkly supports two fields for expanding the \"Get metric\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with any of the following fields:  - `experiments` includes all experiments from the specific project that use the metric - `experimentCount` includes the number of experiments from the specific project that use the metric  For example, `expand=experiments` includes the `experiments` field in the response. 

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

api_instance = LaunchDarklyApi::MetricsApi.new
project_key = 'project_key_example' # String | The project key
metric_key = 'metric_key_example' # String | The metric key
opts = {
  expand: 'expand_example' # String | A comma-separated list of properties that can reveal additional information in the response.
}

begin
  # Get metric
  result = api_instance.get_metric(project_key, metric_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->get_metric: #{e}"
end
```

#### Using the get_metric_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MetricRep>, Integer, Hash)> get_metric_with_http_info(project_key, metric_key, opts)

```ruby
begin
  # Get metric
  data, status_code, headers = api_instance.get_metric_with_http_info(project_key, metric_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MetricRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->get_metric_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **metric_key** | **String** | The metric key |  |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. | [optional] |

### Return type

[**MetricRep**](MetricRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_metrics

> <MetricCollectionRep> get_metrics(project_key, opts)

List metrics

Get a list of all metrics for the specified project.

### Expanding the metric list response LaunchDarkly supports expanding the \"List metrics\" response. By default, the expandable field is **not** included in the response.  To expand the response, append the `expand` query parameter and add the following supported field:  - `experimentCount` includes the number of experiments from the specific project that use the metric  For example, `expand=experimentCount` includes the `experimentCount` field for each metric in the response. 

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

api_instance = LaunchDarklyApi::MetricsApi.new
project_key = 'project_key_example' # String | The project key
opts = {
  expand: 'expand_example' # String | A comma-separated list of properties that can reveal additional information in the response.
}

begin
  # List metrics
  result = api_instance.get_metrics(project_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->get_metrics: #{e}"
end
```

#### Using the get_metrics_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MetricCollectionRep>, Integer, Hash)> get_metrics_with_http_info(project_key, opts)

```ruby
begin
  # List metrics
  data, status_code, headers = api_instance.get_metrics_with_http_info(project_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MetricCollectionRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->get_metrics_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. | [optional] |

### Return type

[**MetricCollectionRep**](MetricCollectionRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_metric

> <MetricRep> patch_metric(project_key, metric_key, patch_operation)

Update metric

Patch a metric by key.

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

api_instance = LaunchDarklyApi::MetricsApi.new
project_key = 'project_key_example' # String | The project key
metric_key = 'metric_key_example' # String | The metric key
patch_operation = [LaunchDarklyApi::PatchOperation.new({op: 'replace', path: '/exampleField', value: new example value})] # Array<PatchOperation> | 

begin
  # Update metric
  result = api_instance.patch_metric(project_key, metric_key, patch_operation)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->patch_metric: #{e}"
end
```

#### Using the patch_metric_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MetricRep>, Integer, Hash)> patch_metric_with_http_info(project_key, metric_key, patch_operation)

```ruby
begin
  # Update metric
  data, status_code, headers = api_instance.patch_metric_with_http_info(project_key, metric_key, patch_operation)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MetricRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->patch_metric_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **metric_key** | **String** | The metric key |  |
| **patch_operation** | [**Array&lt;PatchOperation&gt;**](PatchOperation.md) |  |  |

### Return type

[**MetricRep**](MetricRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## post_metric

> <MetricRep> post_metric(project_key, metric_post)

Create metric

Create a new metric in the specified project. The expected `POST` body differs depending on the specified `kind` property.

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

api_instance = LaunchDarklyApi::MetricsApi.new
project_key = 'project_key_example' # String | The project key
metric_post = LaunchDarklyApi::MetricPost.new({key: 'metric-key-123abc', kind: 'pageview'}) # MetricPost | 

begin
  # Create metric
  result = api_instance.post_metric(project_key, metric_post)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->post_metric: #{e}"
end
```

#### Using the post_metric_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MetricRep>, Integer, Hash)> post_metric_with_http_info(project_key, metric_post)

```ruby
begin
  # Create metric
  data, status_code, headers = api_instance.post_metric_with_http_info(project_key, metric_post)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MetricRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling MetricsApi->post_metric_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **metric_post** | [**MetricPost**](MetricPost.md) |  |  |

### Return type

[**MetricRep**](MetricRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

