# LaunchDarklyApi::WorkflowsBetaApi

All URIs are relative to *https://app.launchdarkly.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_workflow**](WorkflowsBetaApi.md#delete_workflow) | **DELETE** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/workflows/{workflowId} | Delete workflow |
| [**get_custom_workflow**](WorkflowsBetaApi.md#get_custom_workflow) | **GET** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/workflows/{workflowId} | Get custom workflow |
| [**get_workflows**](WorkflowsBetaApi.md#get_workflows) | **GET** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/workflows | Get workflows |
| [**post_workflow**](WorkflowsBetaApi.md#post_workflow) | **POST** /api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/workflows | Create workflow |


## delete_workflow

> delete_workflow(project_key, feature_flag_key, environment_key, workflow_id)

Delete workflow

Delete a workflow from a feature flag.

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

api_instance = LaunchDarklyApi::WorkflowsBetaApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
workflow_id = 'workflow_id_example' # String | The workflow id

begin
  # Delete workflow
  api_instance.delete_workflow(project_key, feature_flag_key, environment_key, workflow_id)
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling WorkflowsBetaApi->delete_workflow: #{e}"
end
```

#### Using the delete_workflow_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_workflow_with_http_info(project_key, feature_flag_key, environment_key, workflow_id)

```ruby
begin
  # Delete workflow
  data, status_code, headers = api_instance.delete_workflow_with_http_info(project_key, feature_flag_key, environment_key, workflow_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling WorkflowsBetaApi->delete_workflow_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **workflow_id** | **String** | The workflow id |  |

### Return type

nil (empty response body)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_custom_workflow

> <CustomWorkflowOutput> get_custom_workflow(project_key, feature_flag_key, environment_key, workflow_id)

Get custom workflow

Get a specific workflow by ID.

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

api_instance = LaunchDarklyApi::WorkflowsBetaApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
workflow_id = 'workflow_id_example' # String | The workflow ID

begin
  # Get custom workflow
  result = api_instance.get_custom_workflow(project_key, feature_flag_key, environment_key, workflow_id)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling WorkflowsBetaApi->get_custom_workflow: #{e}"
end
```

#### Using the get_custom_workflow_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CustomWorkflowOutput>, Integer, Hash)> get_custom_workflow_with_http_info(project_key, feature_flag_key, environment_key, workflow_id)

```ruby
begin
  # Get custom workflow
  data, status_code, headers = api_instance.get_custom_workflow_with_http_info(project_key, feature_flag_key, environment_key, workflow_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CustomWorkflowOutput>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling WorkflowsBetaApi->get_custom_workflow_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **workflow_id** | **String** | The workflow ID |  |

### Return type

[**CustomWorkflowOutput**](CustomWorkflowOutput.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_workflows

> <CustomWorkflowsListingOutput> get_workflows(project_key, feature_flag_key, environment_key, opts)

Get workflows

Display workflows associated with a feature flag.

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

api_instance = LaunchDarklyApi::WorkflowsBetaApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
opts = {
  status: 'status_example', # String | Filter results by workflow status. Valid status filters are `active`, `completed`, and `failed`.
  sort: 'sort_example' # String | A field to sort the items by. Prefix field by a dash ( - ) to sort in descending order. This endpoint supports sorting by `creationDate` or `stopDate`.
}

begin
  # Get workflows
  result = api_instance.get_workflows(project_key, feature_flag_key, environment_key, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling WorkflowsBetaApi->get_workflows: #{e}"
end
```

#### Using the get_workflows_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CustomWorkflowsListingOutput>, Integer, Hash)> get_workflows_with_http_info(project_key, feature_flag_key, environment_key, opts)

```ruby
begin
  # Get workflows
  data, status_code, headers = api_instance.get_workflows_with_http_info(project_key, feature_flag_key, environment_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CustomWorkflowsListingOutput>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling WorkflowsBetaApi->get_workflows_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **status** | **String** | Filter results by workflow status. Valid status filters are &#x60;active&#x60;, &#x60;completed&#x60;, and &#x60;failed&#x60;. | [optional] |
| **sort** | **String** | A field to sort the items by. Prefix field by a dash ( - ) to sort in descending order. This endpoint supports sorting by &#x60;creationDate&#x60; or &#x60;stopDate&#x60;. | [optional] |

### Return type

[**CustomWorkflowsListingOutput**](CustomWorkflowsListingOutput.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## post_workflow

> <CustomWorkflowOutput> post_workflow(project_key, feature_flag_key, environment_key, custom_workflow_input, opts)

Create workflow

Create a workflow for a feature flag. You can create a workflow directly, or you can apply a template to create a new workflow.

### Creating a workflow  You can use the create workflow endpoint to create a workflow directly by adding a `stages` array to the request body.  For each stage, define the `name`, `conditions` when the stage should be executed, and `action` that describes the stage.  <details> <summary>Click to expand example</summary>  _Example request body_ ```json {   \"name\": \"Progressive rollout starting in two days\",   \"description\": \"Turn flag on for 10% of customers each day\",   \"stages\": [     {       \"name\": \"10% rollout on day 1\",       \"conditions\": [         {           \"kind\": \"schedule\",           \"scheduleKind\": \"relative\", // or \"absolute\"               //  If \"scheduleKind\" is \"absolute\", set \"executionDate\";               // \"waitDuration\" and \"waitDurationUnit\" will be ignored           \"waitDuration\": 2,           \"waitDurationUnit\": \"calendarDay\"         },         {           \"kind\": \"ld-approval\",           \"notifyMemberIds\": [ \"507f1f77bcf86cd799439011\" ],           \"notifyTeamKeys\": [ \"team-key-123abc\" ]         }       ],       \"action\": {         \"instructions\": [           {             \"kind\": \"turnFlagOn\"           },           {             \"kind\": \"updateFallthroughVariationOrRollout\",             \"rolloutWeights\": {               \"452f5fb5-7320-4ba3-81a1-8f4324f79d49\": 90000,               \"fc15f6a4-05d3-4aa4-a997-446be461345d\": 10000             }           }         ]       }     }   ] } ``` </details>

### Creating a workflow by applying a workflow template  You can also create a workflow by applying a workflow template. If you pass a valid workflow template key as the `templateKey` query parameter with the request, the API will attempt to create a new workflow with the stages defined in the workflow template with the corresponding key.

#### Applicability of stages Templates are created in the context of a particular flag in a particular environment in a particular project. However, because workflows created from a template can be applied to any project, environment, and flag, some steps of the workflow may need to be updated in order to be applicable for the target resource.  You can pass a `dryRun` query parameter to tell the API to return a report of which steps of the workflow template are applicable in the target project/environment/flag, and which will need to be updated. When the `dryRun` query parameter is present the response body includes a `meta` property that holds a list of parameters that could potentially be inapplicable for the target resource. Each of these parameters will include a `valid` field. You will need to update any invalid parameters in order to create the new workflow. You can do this using the `parameters` property, which overrides the workflow template parameters.

#### Overriding template parameters You can use the `parameters` property in the request body to tell the API to override the specified workflow template parameters with new values that are specific to your target project/environment/flag.  <details> <summary>Click to expand example</summary>  _Example request body_ ```json {  \"name\": \"workflow created from my-template\",  \"description\": \"description of my workflow\",  \"parameters\": [   {    \"_id\": \"62cf2bc4cadbeb7697943f3b\",    \"path\": \"/clauses/0/values\",    \"default\": {     \"value\": [\"updated-segment\"]    }   },   {    \"_id\": \"62cf2bc4cadbeb7697943f3d\",    \"path\": \"/variationId\",    \"default\": {     \"value\": \"abcd1234-abcd-1234-abcd-1234abcd12\"    }   }  ] } ``` </details>  If there are any steps in the template that are not applicable to the target resource, the workflow will not be created, and the `meta` property will be included in the response body detailing which parameters need to be updated. 

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

api_instance = LaunchDarklyApi::WorkflowsBetaApi.new
project_key = 'project_key_example' # String | The project key
feature_flag_key = 'feature_flag_key_example' # String | The feature flag key
environment_key = 'environment_key_example' # String | The environment key
custom_workflow_input = LaunchDarklyApi::CustomWorkflowInput.new({name: 'Progressive rollout starting in two days'}) # CustomWorkflowInput | 
opts = {
  template_key: 'template_key_example', # String | The template key to apply as a starting point for the new workflow
  dry_run: true # Boolean | Whether to call the endpoint in dry-run mode
}

begin
  # Create workflow
  result = api_instance.post_workflow(project_key, feature_flag_key, environment_key, custom_workflow_input, opts)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling WorkflowsBetaApi->post_workflow: #{e}"
end
```

#### Using the post_workflow_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CustomWorkflowOutput>, Integer, Hash)> post_workflow_with_http_info(project_key, feature_flag_key, environment_key, custom_workflow_input, opts)

```ruby
begin
  # Create workflow
  data, status_code, headers = api_instance.post_workflow_with_http_info(project_key, feature_flag_key, environment_key, custom_workflow_input, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CustomWorkflowOutput>
rescue LaunchDarklyApi::ApiError => e
  puts "Error when calling WorkflowsBetaApi->post_workflow_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_key** | **String** | The project key |  |
| **feature_flag_key** | **String** | The feature flag key |  |
| **environment_key** | **String** | The environment key |  |
| **custom_workflow_input** | [**CustomWorkflowInput**](CustomWorkflowInput.md) |  |  |
| **template_key** | **String** | The template key to apply as a starting point for the new workflow | [optional] |
| **dry_run** | **Boolean** | Whether to call the endpoint in dry-run mode | [optional] |

### Return type

[**CustomWorkflowOutput**](CustomWorkflowOutput.md)

### Authorization

[ApiKey](../README.md#ApiKey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

