This repository contains a client library for LaunchDarkly's REST API. This client was automatically
generated from our [OpenAPI specification](https://github.com/launchdarkly/ld-openapi).

This REST API is for custom integrations, data export, or automating your feature flag workflows. *DO NOT* use this client library to add feature flags to your web or mobile application. To integrate feature flags with your application, please see the [SDK documentation](https://docs.launchdarkly.com/v2.0/docs)

# launchdarkly_api

`launchdarkly_api` - the Ruby gem for the LaunchDarkly REST API

Build custom integrations with the LaunchDarkly REST API

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2.0.6
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen
For more information, please visit [https://support.launchdarkly.com](https://support.launchdarkly.com)

## Installation

In the steps shown below, substitute the current API version where you see `VERSION`.

### To use the latest release from RubyGems

Add this to your Gemfile:

    gem 'launchdarkly_api', '~> VERSION'

### To use source code from Git

Use this method if you want to use an alternate branch or a fork from Git. Add the following in the Gemfile:

    gem 'launchdarkly_api', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### To build the gem locally

Check out the source code, then build it:

```shell
gem build launchdarkly_api.gemspec
```

Then install the gem locally:

```shell
gem install ./launchdarkly-api-VERSION.gem
# To include development dependencies, use gem install --dev
```

Finally add this to the Gemfile:

    gem 'launchdarkly_api', '~> VERSION'

## Usage examples

### Getting the name and description of a feature flag

```ruby
require 'launchdarkly_api'

api_key = 'put a valid API key for your account here'
project_key = 'put the key of your project here'
flag_key = 'put the key of a feature flag here'

LaunchDarklyApi.configure do |config|
  config.api_key['Authorization'] = api_key
end

flag_api = LaunchDarklyApi::FeatureFlagsApi.new

begin
  flag = flag_api.get_feature_flag(project_key, flag_key)
  puts "Flag key: #{flag_key}, name: #{flag.name}, description: #{flag.description}"
rescue LaunchDarklyApi::ApiError => e
  puts "API returned error: #{e.message} #{e.response_body}"
end
```

### Modifying a feature flag

```ruby
require 'launchdarkly_api'

api_key = 'put a valid API key for your account here'
project_key = 'put the key of your project here'
environment_key = 'the key of the environment where you want to change the flag'
flag_key = 'put the key of a feature flag here'

LaunchDarklyApi.configure do |config|
  config.api_key['Authorization'] = api_key
end

flag_api = LaunchDarklyApi::FeatureFlagsApi.new

# This example turns on targeting for the specified flag.
# Properties are modified with JSON Patch syntax - http://jsonpatch.com/
# Note that all environment-specific properties have a path prefix that includes the environment key.
property_path = "/environments/#{environment_key}/on"
new_value = true
patches = [ LaunchDarklyApi::PatchOperation.new(op: 'replace', path: property_path, value: new_value) ]
patch_and_comment = LaunchDarklyApi::PatchComment.new(patch: patches, comment: 'turning flag on')

begin
  flag_api.patch_feature_flag(project_key, flag_key, patch_and_comment)
rescue LaunchDarklyApi::ApiError => e
  puts "API returned error: #{e.message} #{e.response_body}"
end
```

### Querying the audit log

```ruby
# Load the gem
require 'launchdarkly_api'

api_key = 'put a valid API key for your account here'

LaunchDarklyApi.configure do |config|
  config.api_key['Authorization'] = api_key
end

audit_log_api = LaunchDarklyApi::AuditLogApi.new

current_time_millis = (Time.now.to_f * 1000).to_i
one_hour_ago = current_time_millis - (60 * 60 * 1000)

opts = {
  after: one_hour_ago,
  limit: 10
} # see API documentation for other options you can use here

begin
  result = audit_log_api.get_audit_log_entries(opts)
  puts "Audit log entries from the last hour:"
  result.items.each { |item|
    puts item.title
  }
rescue LaunchDarklyApi::ApiError => e
  puts "API returned error: #{e.message} #{e.response_body}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://app.launchdarkly.com/api/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*LaunchDarklyApi::AuditLogApi* | [**get_audit_log_entries**](docs/AuditLogApi.md#get_audit_log_entries) | **GET** /auditlog | Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.
*LaunchDarklyApi::AuditLogApi* | [**get_audit_log_entry**](docs/AuditLogApi.md#get_audit_log_entry) | **GET** /auditlog/{resourceId} | Use this endpoint to fetch a single audit log entry by its resouce ID.
*LaunchDarklyApi::CustomRolesApi* | [**delete_custom_role**](docs/CustomRolesApi.md#delete_custom_role) | **DELETE** /roles/{customRoleKey} | Delete a custom role by key.
*LaunchDarklyApi::CustomRolesApi* | [**get_custom_role**](docs/CustomRolesApi.md#get_custom_role) | **GET** /roles/{customRoleKey} | Get one custom role by key.
*LaunchDarklyApi::CustomRolesApi* | [**get_custom_roles**](docs/CustomRolesApi.md#get_custom_roles) | **GET** /roles | Return a complete list of custom roles.
*LaunchDarklyApi::CustomRolesApi* | [**patch_custom_role**](docs/CustomRolesApi.md#patch_custom_role) | **PATCH** /roles/{customRoleKey} | Modify a custom role by key.
*LaunchDarklyApi::CustomRolesApi* | [**post_custom_role**](docs/CustomRolesApi.md#post_custom_role) | **POST** /roles | Create a new custom role.
*LaunchDarklyApi::EnvironmentsApi* | [**delete_environment**](docs/EnvironmentsApi.md#delete_environment) | **DELETE** /projects/{projectKey}/environments/{environmentKey} | Delete an environment in a specific project.
*LaunchDarklyApi::EnvironmentsApi* | [**get_environment**](docs/EnvironmentsApi.md#get_environment) | **GET** /projects/{projectKey}/environments/{environmentKey} | Get an environment given a project and key.
*LaunchDarklyApi::EnvironmentsApi* | [**patch_environment**](docs/EnvironmentsApi.md#patch_environment) | **PATCH** /projects/{projectKey}/environments/{environmentKey} | Modify an environment by ID.
*LaunchDarklyApi::EnvironmentsApi* | [**post_environment**](docs/EnvironmentsApi.md#post_environment) | **POST** /projects/{projectKey}/environments | Create a new environment in a specified project with a given name, key, and swatch color.
*LaunchDarklyApi::FeatureFlagsApi* | [**delete_feature_flag**](docs/FeatureFlagsApi.md#delete_feature_flag) | **DELETE** /flags/{projectKey}/{featureFlagKey} | Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flag**](docs/FeatureFlagsApi.md#get_feature_flag) | **GET** /flags/{projectKey}/{featureFlagKey} | Get a single feature flag by key.
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flag_status**](docs/FeatureFlagsApi.md#get_feature_flag_status) | **GET** /flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey} | Get the status for a particular feature flag.
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flag_statuses**](docs/FeatureFlagsApi.md#get_feature_flag_statuses) | **GET** /flag-statuses/{projectKey}/{environmentKey} | Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flags**](docs/FeatureFlagsApi.md#get_feature_flags) | **GET** /flags/{projectKey} | Get a list of all features in the given project.
*LaunchDarklyApi::FeatureFlagsApi* | [**patch_feature_flag**](docs/FeatureFlagsApi.md#patch_feature_flag) | **PATCH** /flags/{projectKey}/{featureFlagKey} | Perform a partial update to a feature.
*LaunchDarklyApi::FeatureFlagsApi* | [**post_feature_flag**](docs/FeatureFlagsApi.md#post_feature_flag) | **POST** /flags/{projectKey} | Creates a new feature flag.
*LaunchDarklyApi::ProjectsApi* | [**delete_project**](docs/ProjectsApi.md#delete_project) | **DELETE** /projects/{projectKey} | Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.
*LaunchDarklyApi::ProjectsApi* | [**get_project**](docs/ProjectsApi.md#get_project) | **GET** /projects/{projectKey} | Fetch a single project by key.
*LaunchDarklyApi::ProjectsApi* | [**get_projects**](docs/ProjectsApi.md#get_projects) | **GET** /projects | Returns a list of all projects in the account.
*LaunchDarklyApi::ProjectsApi* | [**patch_project**](docs/ProjectsApi.md#patch_project) | **PATCH** /projects/{projectKey} | Modify a project by ID.
*LaunchDarklyApi::ProjectsApi* | [**post_project**](docs/ProjectsApi.md#post_project) | **POST** /projects | Create a new project with the given key and name.
*LaunchDarklyApi::RootApi* | [**get_root**](docs/RootApi.md#get_root) | **GET** / | 
*LaunchDarklyApi::TeamMembersApi* | [**delete_member**](docs/TeamMembersApi.md#delete_member) | **DELETE** /members/{memberId} | Delete a team member by ID.
*LaunchDarklyApi::TeamMembersApi* | [**get_member**](docs/TeamMembersApi.md#get_member) | **GET** /members/{memberId} | Get a single team member by ID.
*LaunchDarklyApi::TeamMembersApi* | [**get_members**](docs/TeamMembersApi.md#get_members) | **GET** /members | Returns a list of all members in the account.
*LaunchDarklyApi::TeamMembersApi* | [**patch_member**](docs/TeamMembersApi.md#patch_member) | **PATCH** /members/{memberId} | Modify a team member by ID.
*LaunchDarklyApi::TeamMembersApi* | [**post_members**](docs/TeamMembersApi.md#post_members) | **POST** /members | Invite new members.
*LaunchDarklyApi::UserSegmentsApi* | [**delete_user_segment**](docs/UserSegmentsApi.md#delete_user_segment) | **DELETE** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Delete a user segment.
*LaunchDarklyApi::UserSegmentsApi* | [**get_user_segment**](docs/UserSegmentsApi.md#get_user_segment) | **GET** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Get a single user segment by key.
*LaunchDarklyApi::UserSegmentsApi* | [**get_user_segments**](docs/UserSegmentsApi.md#get_user_segments) | **GET** /segments/{projectKey}/{environmentKey} | Get a list of all user segments in the given project.
*LaunchDarklyApi::UserSegmentsApi* | [**patch_user_segment**](docs/UserSegmentsApi.md#patch_user_segment) | **PATCH** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Perform a partial update to a user segment.
*LaunchDarklyApi::UserSegmentsApi* | [**post_user_segment**](docs/UserSegmentsApi.md#post_user_segment) | **POST** /segments/{projectKey}/{environmentKey} | Creates a new user segment.
*LaunchDarklyApi::UserSettingsApi* | [**get_user_flag_setting**](docs/UserSettingsApi.md#get_user_flag_setting) | **GET** /users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Fetch a single flag setting for a user by key.
*LaunchDarklyApi::UserSettingsApi* | [**get_user_flag_settings**](docs/UserSettingsApi.md#get_user_flag_settings) | **GET** /users/{projectKey}/{environmentKey}/{userKey}/flags | Fetch a single flag setting for a user by key.
*LaunchDarklyApi::UserSettingsApi* | [**put_flag_setting**](docs/UserSettingsApi.md#put_flag_setting) | **PUT** /users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Specifically enable or disable a feature flag for a user based on their key.
*LaunchDarklyApi::UsersApi* | [**delete_user**](docs/UsersApi.md#delete_user) | **DELETE** /users/{projectKey}/{environmentKey}/{userKey} | Delete a user by ID.
*LaunchDarklyApi::UsersApi* | [**get_search_users**](docs/UsersApi.md#get_search_users) | **GET** /user-search/{projectKey}/{environmentKey} | Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource.
*LaunchDarklyApi::UsersApi* | [**get_user**](docs/UsersApi.md#get_user) | **GET** /users/{projectKey}/{environmentKey}/{userKey} | Get a user by key.
*LaunchDarklyApi::UsersApi* | [**get_users**](docs/UsersApi.md#get_users) | **GET** /users/{projectKey}/{environmentKey} | List all users in the environment. Includes the total count of users. In each page, there will be up to 'limit' users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection.
*LaunchDarklyApi::WebhooksApi* | [**delete_webhook**](docs/WebhooksApi.md#delete_webhook) | **DELETE** /webhooks/{resourceId} | Delete a webhook by ID.
*LaunchDarklyApi::WebhooksApi* | [**get_webhook**](docs/WebhooksApi.md#get_webhook) | **GET** /webhooks/{resourceId} | Get a webhook by ID.
*LaunchDarklyApi::WebhooksApi* | [**get_webhooks**](docs/WebhooksApi.md#get_webhooks) | **GET** /webhooks | Fetch a list of all webhooks.
*LaunchDarklyApi::WebhooksApi* | [**patch_webhook**](docs/WebhooksApi.md#patch_webhook) | **PATCH** /webhooks/{resourceId} | Modify a webhook by ID.
*LaunchDarklyApi::WebhooksApi* | [**post_webhook**](docs/WebhooksApi.md#post_webhook) | **POST** /webhooks | Create a webhook.


## Documentation for Models

 - [LaunchDarklyApi::Action](docs/Action.md)
 - [LaunchDarklyApi::Actions](docs/Actions.md)
 - [LaunchDarklyApi::AuditLogEntries](docs/AuditLogEntries.md)
 - [LaunchDarklyApi::AuditLogEntry](docs/AuditLogEntry.md)
 - [LaunchDarklyApi::AuditLogEntryTarget](docs/AuditLogEntryTarget.md)
 - [LaunchDarklyApi::Clause](docs/Clause.md)
 - [LaunchDarklyApi::CustomRole](docs/CustomRole.md)
 - [LaunchDarklyApi::CustomRoleBody](docs/CustomRoleBody.md)
 - [LaunchDarklyApi::CustomRoleKeyOrId](docs/CustomRoleKeyOrId.md)
 - [LaunchDarklyApi::CustomRoles](docs/CustomRoles.md)
 - [LaunchDarklyApi::Environment](docs/Environment.md)
 - [LaunchDarklyApi::EnvironmentBody](docs/EnvironmentBody.md)
 - [LaunchDarklyApi::Fallthrough](docs/Fallthrough.md)
 - [LaunchDarklyApi::FeatureFlag](docs/FeatureFlag.md)
 - [LaunchDarklyApi::FeatureFlagBody](docs/FeatureFlagBody.md)
 - [LaunchDarklyApi::FeatureFlagConfig](docs/FeatureFlagConfig.md)
 - [LaunchDarklyApi::FeatureFlagStatus](docs/FeatureFlagStatus.md)
 - [LaunchDarklyApi::FeatureFlagStatuses](docs/FeatureFlagStatuses.md)
 - [LaunchDarklyApi::FeatureFlags](docs/FeatureFlags.md)
 - [LaunchDarklyApi::Id](docs/Id.md)
 - [LaunchDarklyApi::Link](docs/Link.md)
 - [LaunchDarklyApi::Links](docs/Links.md)
 - [LaunchDarklyApi::Member](docs/Member.md)
 - [LaunchDarklyApi::Members](docs/Members.md)
 - [LaunchDarklyApi::MembersBody](docs/MembersBody.md)
 - [LaunchDarklyApi::PatchComment](docs/PatchComment.md)
 - [LaunchDarklyApi::PatchOperation](docs/PatchOperation.md)
 - [LaunchDarklyApi::Policy](docs/Policy.md)
 - [LaunchDarklyApi::Prerequisite](docs/Prerequisite.md)
 - [LaunchDarklyApi::Project](docs/Project.md)
 - [LaunchDarklyApi::ProjectBody](docs/ProjectBody.md)
 - [LaunchDarklyApi::Projects](docs/Projects.md)
 - [LaunchDarklyApi::Resource](docs/Resource.md)
 - [LaunchDarklyApi::Resources](docs/Resources.md)
 - [LaunchDarklyApi::Role](docs/Role.md)
 - [LaunchDarklyApi::Rollout](docs/Rollout.md)
 - [LaunchDarklyApi::Rule](docs/Rule.md)
 - [LaunchDarklyApi::Statement](docs/Statement.md)
 - [LaunchDarklyApi::Statements](docs/Statements.md)
 - [LaunchDarklyApi::Target](docs/Target.md)
 - [LaunchDarklyApi::User](docs/User.md)
 - [LaunchDarklyApi::UserFlagSetting](docs/UserFlagSetting.md)
 - [LaunchDarklyApi::UserFlagSettings](docs/UserFlagSettings.md)
 - [LaunchDarklyApi::UserRecord](docs/UserRecord.md)
 - [LaunchDarklyApi::UserSegment](docs/UserSegment.md)
 - [LaunchDarklyApi::UserSegmentBody](docs/UserSegmentBody.md)
 - [LaunchDarklyApi::UserSegmentRule](docs/UserSegmentRule.md)
 - [LaunchDarklyApi::UserSegments](docs/UserSegments.md)
 - [LaunchDarklyApi::UserSettingsBody](docs/UserSettingsBody.md)
 - [LaunchDarklyApi::Users](docs/Users.md)
 - [LaunchDarklyApi::Variation](docs/Variation.md)
 - [LaunchDarklyApi::Webhook](docs/Webhook.md)
 - [LaunchDarklyApi::WebhookBody](docs/WebhookBody.md)
 - [LaunchDarklyApi::Webhooks](docs/Webhooks.md)
 - [LaunchDarklyApi::WeightedVariation](docs/WeightedVariation.md)


## Documentation for Authorization


### Token

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header
