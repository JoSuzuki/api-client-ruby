# LaunchDarklyApi::ExperimentsBetaApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_experiment**](ExperimentsBetaApi.md#create_experiment) | **POST** /api/v2/projects/{projectKey}/environments/{environmentKey}/experiments | Create experiment |
| [**create_iteration**](ExperimentsBetaApi.md#create_iteration) | **POST** /api/v2/projects/{projectKey}/environments/{environmentKey}/experiments/{experimentKey}/iterations | Create iteration |
| [**get_experiment**](ExperimentsBetaApi.md#get_experiment) | **GET** /api/v2/projects/{projectKey}/environments/{environmentKey}/experiments/{experimentKey} | Get experiment |
| [**get_experiment_results**](ExperimentsBetaApi.md#get_experiment_results) | **GET** /api/v2/projects/{projectKey}/environments/{environmentKey}/experiments/{experimentKey}/metrics/{metricKey}/results | Get experiment results |
| [**get_experimentation_settings**](ExperimentsBetaApi.md#get_experimentation_settings) | **GET** /api/v2/projects/{projectKey}/experimentation-settings | Get experimentation settings |
| [**get_experiments**](ExperimentsBetaApi.md#get_experiments) | **GET** /api/v2/projects/{projectKey}/environments/{environmentKey}/experiments | Get experiments |
| [**get_legacy_experiment_results**](ExperimentsBetaApi.md#get_legacy_experiment_results) | **GET** /api/v2/flags/{projectKey}/{featureFlagKey}/experiments/{environmentKey}/{metricKey} | Get legacy experiment results (deprecated) |
| [**patch_experiment**](ExperimentsBetaApi.md#patch_experiment) | **PATCH** /api/v2/projects/{projectKey}/environments/{environmentKey}/experiments/{experimentKey} | Patch experiment |
| [**put_experimentation_settings**](ExperimentsBetaApi.md#put_experimentation_settings) | **PUT** /api/v2/projects/{projectKey}/experimentation-settings | Update experimentation settings |
| [**reset_experiment**](ExperimentsBetaApi.md#reset_experiment) | **DELETE** /api/v2/flags/{projectKey}/{featureFlagKey}/experiments/{environmentKey}/{metricKey}/results | Reset experiment results |


## create_experiment

> <Experiment> create_experiment(project_key, environment_key, experiment_post)

Create experiment

Create an experiment.  To run this experiment, you'll need to [create an iteration](/tag/Experiments-(beta)#operation/createIteration) and then [update the experiment](/tag/Experiments-(beta)#operation/patchExperiment) with the `startIteration` instruction.  To learn more, read [Creating experiments](https://docs.launchdarkly.com/home/creating-experiments). 

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
experiment_post = LaunchDarklyApi::ExperimentPost.new({name: 'Example experiment', maintainer_id: '12ab3c45de678910fgh12345', key: 'experiment-key-123abc', iteration: LaunchDarklyApi::IterationInput.new({hypothesis: 'Example hypothesis, the new button placement will increase conversion', metrics: [LaunchDarklyApi::MetricInput.new({key: 'metric-key-123abc', primary: true})], treatments: [LaunchDarklyApi::TreatmentInput.new({name: 'Treatment 1', baseline: true, allocation_percent: '10', parameters: [LaunchDarklyApi::TreatmentParameterInput.new({flag_key: 'example-flag-for-experiment', variation_id: 'e432f62b-55f6-49dd-a02f-eb24acf39d05'})]})], flags: { key: LaunchDarklyApi::FlagInput.new({rule_id: 'e432f62b-55f6-49dd-a02f-eb24acf39d05', flag_config_version: 12})}})}) # ExperimentPost | 

begin
  # Create experiment
  result = api_instance.create_experiment(project_key, environment_key, experiment_post)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->create_experiment: #{e}"
end
```

#### Using the create_experiment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Experiment>, Integer, Hash)> create_experiment_with_http_info(project_key, environment_key, experiment_post)

```ruby
begin
  # Create experiment
  data, status_code, headers = api_instance.create_experiment_with_http_info(project_key, environment_key, experiment_post)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Experiment>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->create_experiment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **experiment_post** | [**ExperimentPost**](ExperimentPost.md) |  |  |

### Return type

[**Experiment**](Experiment.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_iteration

> <IterationRep> create_iteration(project_key, environment_key, experiment_key, iteration_input)

Create iteration

Create an experiment iteration.  Experiment iterations let you record experiments in individual blocks of time. Initially, iterations are created with a status of `not_started` and appear in the `draftIteration` field of an experiment. To start or stop an iteration, [update the experiment](/tag/Experiments-(beta)#operation/patchExperiment) with the `startIteration` or `stopIteration` instruction.   To learn more, read [Starting experiment iterations](https://docs.launchdarkly.com/home/creating-experiments#starting-experiment-iterations). 

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
experiment_key = 'experiment_key_example' # String | The experiment key
iteration_input = LaunchDarklyApi::IterationInput.new({hypothesis: 'Example hypothesis, the new button placement will increase conversion', metrics: [LaunchDarklyApi::MetricInput.new({key: 'metric-key-123abc', primary: true})], treatments: [LaunchDarklyApi::TreatmentInput.new({name: 'Treatment 1', baseline: true, allocation_percent: '10', parameters: [LaunchDarklyApi::TreatmentParameterInput.new({flag_key: 'example-flag-for-experiment', variation_id: 'e432f62b-55f6-49dd-a02f-eb24acf39d05'})]})], flags: { key: LaunchDarklyApi::FlagInput.new({rule_id: 'e432f62b-55f6-49dd-a02f-eb24acf39d05', flag_config_version: 12})}}) # IterationInput | 

begin
  # Create iteration
  result = api_instance.create_iteration(project_key, environment_key, experiment_key, iteration_input)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->create_iteration: #{e}"
end
```

#### Using the create_iteration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<IterationRep>, Integer, Hash)> create_iteration_with_http_info(project_key, environment_key, experiment_key, iteration_input)

```ruby
begin
  # Create iteration
  data, status_code, headers = api_instance.create_iteration_with_http_info(project_key, environment_key, experiment_key, iteration_input)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <IterationRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->create_iteration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **experiment_key** | **String** | The experiment key |  |
| **iteration_input** | [**IterationInput**](IterationInput.md) |  |  |

### Return type

[**IterationRep**](IterationRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_experiment

> <Experiment> get_experiment(project_key, environment_key, experiment_key)

Get experiment

Get details about an experiment.

### Expanding the experiment response  LaunchDarkly supports four fields for expanding the \"Get experiment\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with any of the following fields:  - `previousIterations` includes all iterations prior to the current iteration. By default only the current iteration is included in the response. - `draftIteration` includes the iteration which has not been started yet, if any. - `secondaryMetrics` includes secondary metrics. By default only the primary metric is included in the response. - `treatments` includes all treatment and parameter details. By default treatment data is not included in the response.  For example, `expand=draftIteration,treatments` includes the `draftIteration` and `treatments` fields in the response. If fields that you request with the `expand` query parameter are empty, they are not included in the response. 

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
experiment_key = 'experiment_key_example' # String | The experiment key

begin
  # Get experiment
  result = api_instance.get_experiment(project_key, environment_key, experiment_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_experiment: #{e}"
end
```

#### Using the get_experiment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Experiment>, Integer, Hash)> get_experiment_with_http_info(project_key, environment_key, experiment_key)

```ruby
begin
  # Get experiment
  data, status_code, headers = api_instance.get_experiment_with_http_info(project_key, environment_key, experiment_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Experiment>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_experiment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **experiment_key** | **String** | The experiment key |  |

### Return type

[**Experiment**](Experiment.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_experiment_results

> <ExperimentBayesianResultsRep> get_experiment_results(project_key, environment_key, experiment_key, metric_key)

Get experiment results

Get results from an experiment for a particular metric.

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
experiment_key = 'experiment_key_example' # String | The experiment key
metric_key = 'metric_key_example' # String | The metric key

begin
  # Get experiment results
  result = api_instance.get_experiment_results(project_key, environment_key, experiment_key, metric_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_experiment_results: #{e}"
end
```

#### Using the get_experiment_results_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExperimentBayesianResultsRep>, Integer, Hash)> get_experiment_results_with_http_info(project_key, environment_key, experiment_key, metric_key)

```ruby
begin
  # Get experiment results
  data, status_code, headers = api_instance.get_experiment_results_with_http_info(project_key, environment_key, experiment_key, metric_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExperimentBayesianResultsRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_experiment_results_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **experiment_key** | **String** | The experiment key |  |
| **metric_key** | **String** | The metric key |  |

### Return type

[**ExperimentBayesianResultsRep**](ExperimentBayesianResultsRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_experimentation_settings

> <ExperimentationSettingsRep> get_experimentation_settings(project_key)

Get experimentation settings

Get current experimentation settings for the given project

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key

begin
  # Get experimentation settings
  result = api_instance.get_experimentation_settings(project_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_experimentation_settings: #{e}"
end
```

#### Using the get_experimentation_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExperimentationSettingsRep>, Integer, Hash)> get_experimentation_settings_with_http_info(project_key)

```ruby
begin
  # Get experimentation settings
  data, status_code, headers = api_instance.get_experimentation_settings_with_http_info(project_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExperimentationSettingsRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_experimentation_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |

### Return type

[**ExperimentationSettingsRep**](ExperimentationSettingsRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_experiments

> <ExperimentCollectionRep> get_experiments(project_key, environment_key, opts)

Get experiments

Get details about all experiments in an environment.

### Filtering experiments  LaunchDarkly supports the `filter` query param for filtering, with the following fields:  - `flagKey` filters for only experiments that use the flag with the given key. - `metricKey` filters for only experiments that use the metric with the given key. - `status` filters for only experiments with an iteration with the given status. An iteration can have the status `not_started`, `running` or `stopped`.  For example, `filter=flagKey:my-flag,status:running,metricKey:page-load-ms` filters for experiments for the given flag key and the given metric key which have a currently running iteration.

### Expanding the experiments response  LaunchDarkly supports four fields for expanding the \"Get experiments\" response. By default, these fields are **not** included in the response.  To expand the response, append the `expand` query parameter and add a comma-separated list with any of the following fields:  - `previousIterations` includes all iterations prior to the current iteration. By default only the current iteration is included in the response. - `draftIteration` includes the iteration which has not been started yet, if any. - `secondaryMetrics` includes secondary metrics. By default only the primary metric is included in the response. - `treatments` includes all treatment and parameter details. By default treatment data is not included in the response.  For example, `expand=draftIteration,treatments` includes the `draftIteration` and `treatments` fields in the response. If fields that you request with the `expand` query parameter are empty, they are not included in the response. 

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
opts = {
  limit: 789, # Integer | The maximum number of experiments to return. Defaults to 20.
  offset: 789, # Integer | Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query `limit`.
  filter: 'filter_example', # String | A comma-separated list of filters. Each filter is of the form `field:value`. Supported fields are explained above.
  expand: 'expand_example', # String | A comma-separated list of properties that can reveal additional information in the response. Supported fields are explained above.
  lifecycle_state: 'lifecycle_state_example' # String | A comma-separated list of experiment archived states. Supports `archived`, `active`, or both. Defaults to `active` experiments.
}

begin
  # Get experiments
  result = api_instance.get_experiments(project_key, environment_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_experiments: #{e}"
end
```

#### Using the get_experiments_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExperimentCollectionRep>, Integer, Hash)> get_experiments_with_http_info(project_key, environment_key, opts)

```ruby
begin
  # Get experiments
  data, status_code, headers = api_instance.get_experiments_with_http_info(project_key, environment_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExperimentCollectionRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_experiments_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **limit** | **Integer** | The maximum number of experiments to return. Defaults to 20. | [optional] |
| **offset** | **Integer** | Where to start in the list. Use this with pagination. For example, an offset of 10 skips the first ten items and then returns the next items in the list, up to the query &#x60;limit&#x60;. | [optional] |
| **filter** | **String** | A comma-separated list of filters. Each filter is of the form &#x60;field:value&#x60;. Supported fields are explained above. | [optional] |
| **expand** | **String** | A comma-separated list of properties that can reveal additional information in the response. Supported fields are explained above. | [optional] |
| **lifecycle_state** | **String** | A comma-separated list of experiment archived states. Supports &#x60;archived&#x60;, &#x60;active&#x60;, or both. Defaults to &#x60;active&#x60; experiments. | [optional] |

### Return type

[**ExperimentCollectionRep**](ExperimentCollectionRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_legacy_experiment_results

> <ExperimentResults> get_legacy_experiment_results(project_key, feature_flag_key, environment_key, metric_key, opts)

Get legacy experiment results (deprecated)

Get detailed experiment result data for legacy experiments.

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
metric_key = 'metric_key_example' # String | The metric key
opts = {
  from: 789, # Integer | A timestamp denoting the start of the data collection period, expressed as a Unix epoch time in milliseconds.
  to: 789 # Integer | A timestamp denoting the end of the data collection period, expressed as a Unix epoch time in milliseconds.
}

begin
  # Get legacy experiment results (deprecated)
  result = api_instance.get_legacy_experiment_results(project_key, feature_flag_key, environment_key, metric_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_legacy_experiment_results: #{e}"
end
```

#### Using the get_legacy_experiment_results_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExperimentResults>, Integer, Hash)> get_legacy_experiment_results_with_http_info(project_key, feature_flag_key, environment_key, metric_key, opts)

```ruby
begin
  # Get legacy experiment results (deprecated)
  data, status_code, headers = api_instance.get_legacy_experiment_results_with_http_info(project_key, feature_flag_key, environment_key, metric_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExperimentResults>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->get_legacy_experiment_results_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **metric_key** | **String** | The metric key |  |
| **from** | **Integer** | A timestamp denoting the start of the data collection period, expressed as a Unix epoch time in milliseconds. | [optional] |
| **to** | **Integer** | A timestamp denoting the end of the data collection period, expressed as a Unix epoch time in milliseconds. | [optional] |

### Return type

[**ExperimentResults**](ExperimentResults.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_experiment

> <Experiment> patch_experiment(project_key, environment_key, experiment_key, experiment_patch_input)

Patch experiment

Update an experiment. Updating an experiment uses the semantic patch format.  To make a semantic patch request, you must append `domain-model=launchdarkly.semanticpatch` to your `Content-Type` header. To learn more, read [Updates using semantic patch](/reference#updates-using-semantic-patch).

### Instructions  Semantic patch requests support the following `kind` instructions for updating experiments.

#### updateName  Updates the experiment name.

##### Parameters  - `value`: The new name.

#### updateDescription  Updates the experiment description.

##### Parameters  - `value`: The new description.

#### startIteration  Starts a new iteration for this experiment. You must [create a new iteration](/tag/Experiments-(beta)#operation/createIteration) before calling this instruction.  An iteration may not be started until it meets the following criteria:  * Its associated flag is toggled on and is not archived * Its `randomizationUnit` is set * At least one of its `treatments` has a non-zero `allocationPercent`

##### Parameters  - `changeJustification`: The reason for starting a new iteration. Required when you call `startIteration` on an already running experiment, otherwise optional.

#### stopIteration  Stops the current iteration for this experiment.

##### Parameters  - `winningTreatmentId`: The ID of the winning treatment - `winningReason`: The reason for the winner

#### archiveExperiment  Archives this experiment. Archived experiments are hidden by default in the LaunchDarkly user interface. You cannot start new iterations for archived experiments.

#### restoreExperiment  Restores an archived experiment. After restoring an experiment, you can start new iterations for it again. 

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
environment_key = 'environment_key_example' # String | The environment key
experiment_key = 'experiment_key_example' # String | The experiment key
experiment_patch_input = LaunchDarklyApi::ExperimentPatchInput.new({instructions: [{ key: 3.56}]}) # ExperimentPatchInput | 

begin
  # Patch experiment
  result = api_instance.patch_experiment(project_key, environment_key, experiment_key, experiment_patch_input)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->patch_experiment: #{e}"
end
```

#### Using the patch_experiment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Experiment>, Integer, Hash)> patch_experiment_with_http_info(project_key, environment_key, experiment_key, experiment_patch_input)

```ruby
begin
  # Patch experiment
  data, status_code, headers = api_instance.patch_experiment_with_http_info(project_key, environment_key, experiment_key, experiment_patch_input)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Experiment>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->patch_experiment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **environment_key** | **String** | The environment key |  |
| **experiment_key** | **String** | The experiment key |  |
| **experiment_patch_input** | [**ExperimentPatchInput**](ExperimentPatchInput.md) |  |  |

### Return type

[**Experiment**](Experiment.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## put_experimentation_settings

> <ExperimentationSettingsRep> put_experimentation_settings(project_key, experimentation_settings_put)

Update experimentation settings

Update experimentation settings for the given project

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
experimentation_settings_put = LaunchDarklyApi::ExperimentationSettingsPut.new({randomization_units: [LaunchDarklyApi::RandomizationUnitInput.new({randomization_unit: 'user', default: true, standard_randomization_unit: 'guest'})]}) # ExperimentationSettingsPut | 

begin
  # Update experimentation settings
  result = api_instance.put_experimentation_settings(project_key, experimentation_settings_put)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->put_experimentation_settings: #{e}"
end
```

#### Using the put_experimentation_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExperimentationSettingsRep>, Integer, Hash)> put_experimentation_settings_with_http_info(project_key, experimentation_settings_put)

```ruby
begin
  # Update experimentation settings
  data, status_code, headers = api_instance.put_experimentation_settings_with_http_info(project_key, experimentation_settings_put)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExperimentationSettingsRep>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->put_experimentation_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **experimentation_settings_put** | [**ExperimentationSettingsPut**](ExperimentationSettingsPut.md) |  |  |

### Return type

[**ExperimentationSettingsRep**](ExperimentationSettingsRep.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## reset_experiment

> reset_experiment(project_key, feature_flag_key, environment_key, metric_key)

Reset experiment results

Reset all experiment results by deleting all existing data for an experiment.

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

api_instance = LaunchDarklyApi::ExperimentsBetaApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
metric_key = 'metric_key_example' # String | The metric's key

begin
  # Reset experiment results
  api_instance.reset_experiment(project_key, feature_flag_key, environment_key, metric_key)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->reset_experiment: #{e}"
end
```

#### Using the reset_experiment_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> reset_experiment_with_http_info(project_key, feature_flag_key, environment_key, metric_key)

```ruby
begin
  # Reset experiment results
  data, status_code, headers = api_instance.reset_experiment_with_http_info(project_key, feature_flag_key, environment_key, metric_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling ExperimentsBetaApi->reset_experiment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **metric_key** | **String** | The metric&#39;s key |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

