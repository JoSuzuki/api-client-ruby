This repository contains a client library for LaunchDarkly's REST API. This client was automatically
generated from our [OpenAPI specification](https://github.com/launchdarkly/ld-openapi).

This REST API is for custom integrations, data export, or automating your feature flag workflows. *DO NOT* use this client library to include feature flags in your web or mobile application. To integrate feature flags with your application, please see the [SDK documentation](https://docs.launchdarkly.com/v2.0/docs)

# launchdarkly_api

LaunchDarklyApi - the Ruby gem for the LaunchDarkly REST API

Build custom integrations with the LaunchDarkly REST API

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 3.3.1
- Package version: 3.3.1
- Build package: io.swagger.codegen.languages.RubyClientCodegen
For more information, please visit [https://support.launchdarkly.com](https://support.launchdarkly.com)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build launchdarkly_api.gemspec
```

Then either install the gem locally:

```shell
gem install ./launchdarkly_api-3.3.1.gem
```
(for development, run `gem install --dev ./launchdarkly_api-3.3.1.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'launchdarkly_api', '~> 3.3.1'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'launchdarkly_api', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and see the [sample code](#sample%20code) below.

## Documentation for API Endpoints

All URIs are relative to *https://app.launchdarkly.com/api/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*LaunchDarklyApi::AuditLogApi* | [**get_audit_log_entries**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/AuditLogApi.md#get_audit_log_entries) | **GET** /auditlog | Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.
*LaunchDarklyApi::AuditLogApi* | [**get_audit_log_entry**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/AuditLogApi.md#get_audit_log_entry) | **GET** /auditlog/{resourceId} | Use this endpoint to fetch a single audit log entry by its resouce ID.
*LaunchDarklyApi::CustomRolesApi* | [**delete_custom_role**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomRolesApi.md#delete_custom_role) | **DELETE** /roles/{customRoleKey} | Delete a custom role by key.
*LaunchDarklyApi::CustomRolesApi* | [**get_custom_role**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomRolesApi.md#get_custom_role) | **GET** /roles/{customRoleKey} | Get one custom role by key.
*LaunchDarklyApi::CustomRolesApi* | [**get_custom_roles**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomRolesApi.md#get_custom_roles) | **GET** /roles | Return a complete list of custom roles.
*LaunchDarklyApi::CustomRolesApi* | [**patch_custom_role**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomRolesApi.md#patch_custom_role) | **PATCH** /roles/{customRoleKey} | Modify a custom role by key.
*LaunchDarklyApi::CustomRolesApi* | [**post_custom_role**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomRolesApi.md#post_custom_role) | **POST** /roles | Create a new custom role.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_evaluations**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_evaluations) | **GET** /usage/evaluations/{envId}/{flagKey} | Get events usage by event id and the feature flag key.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_event**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_event) | **GET** /usage/events/{type} | Get events usage by event type.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_events**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_events) | **GET** /usage/events | Get events usage endpoints.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_mau**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_mau) | **GET** /usage/mau | Get monthly active user data.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_mau_by_category**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_mau_by_category) | **GET** /usage/mau/bycategory | Get monthly active user data by category.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_stream**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_stream) | **GET** /usage/streams/{source} | Get a stream endpoint and return timeseries data.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_stream_by_sdk**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_stream_by_sdk) | **GET** /usage/streams/{source}/bysdkversion | Get a stream timeseries data by source show sdk version metadata.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_stream_sdk_version**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_stream_sdk_version) | **GET** /usage/streams/{source}/sdkversions | Get a stream timeseries data by source and show all sdk version associated.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_streams**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_streams) | **GET** /usage/streams | Returns a list of all streams.
*LaunchDarklyApi::CustomerMetricsApi* | [**get_usage**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomerMetricsApi.md#get_usage) | **GET** /usage | Returns of the usage endpoints available.
*LaunchDarklyApi::DataExportDestinationsApi* | [**delete_destination**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DataExportDestinationsApi.md#delete_destination) | **DELETE** /destinations/{projectKey}/{environmentKey}/{destinationId} | Get a single data export destination by ID
*LaunchDarklyApi::DataExportDestinationsApi* | [**get_destination**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DataExportDestinationsApi.md#get_destination) | **GET** /destinations/{projectKey}/{environmentKey}/{destinationId} | Get a single data export destination by ID
*LaunchDarklyApi::DataExportDestinationsApi* | [**get_destinations**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DataExportDestinationsApi.md#get_destinations) | **GET** /destinations | Returns a list of all data export destinations.
*LaunchDarklyApi::DataExportDestinationsApi* | [**patch_destination**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DataExportDestinationsApi.md#patch_destination) | **PATCH** /destinations/{projectKey}/{environmentKey}/{destinationId} | Perform a partial update to a data export destination.
*LaunchDarklyApi::DataExportDestinationsApi* | [**post_destination**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DataExportDestinationsApi.md#post_destination) | **POST** /destinations/{projectKey}/{environmentKey} | Create a new data export destination
*LaunchDarklyApi::EnvironmentsApi* | [**delete_environment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/EnvironmentsApi.md#delete_environment) | **DELETE** /projects/{projectKey}/environments/{environmentKey} | Delete an environment in a specific project.
*LaunchDarklyApi::EnvironmentsApi* | [**get_environment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/EnvironmentsApi.md#get_environment) | **GET** /projects/{projectKey}/environments/{environmentKey} | Get an environment given a project and key.
*LaunchDarklyApi::EnvironmentsApi* | [**patch_environment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/EnvironmentsApi.md#patch_environment) | **PATCH** /projects/{projectKey}/environments/{environmentKey} | Modify an environment by ID.
*LaunchDarklyApi::EnvironmentsApi* | [**post_environment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/EnvironmentsApi.md#post_environment) | **POST** /projects/{projectKey}/environments | Create a new environment in a specified project with a given name, key, and swatch color.
*LaunchDarklyApi::FeatureFlagsApi* | [**copy_feature_flag**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#copy_feature_flag) | **POST** /flags/{projectKey}/{featureFlagKey}/copy | Copies the feature flag configuration from one environment to the same feature flag in another environment.
*LaunchDarklyApi::FeatureFlagsApi* | [**delete_feature_flag**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#delete_feature_flag) | **DELETE** /flags/{projectKey}/{featureFlagKey} | Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
*LaunchDarklyApi::FeatureFlagsApi* | [**get_expiring_user_targets**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#get_expiring_user_targets) | **GET** /flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey} | Get expiring user targets for feature flag
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flag**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#get_feature_flag) | **GET** /flags/{projectKey}/{featureFlagKey} | Get a single feature flag by key.
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flag_status**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#get_feature_flag_status) | **GET** /flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey} | Get the status for a particular feature flag.
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flag_status_across_environments**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#get_feature_flag_status_across_environments) | **GET** /flag-status/{projectKey}/{featureFlagKey} | Get the status for a particular feature flag across environments
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flag_statuses**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#get_feature_flag_statuses) | **GET** /flag-statuses/{projectKey}/{environmentKey} | Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
*LaunchDarklyApi::FeatureFlagsApi* | [**get_feature_flags**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#get_feature_flags) | **GET** /flags/{projectKey} | Get a list of all features in the given project.
*LaunchDarklyApi::FeatureFlagsApi* | [**patch_expiring_user_targets**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#patch_expiring_user_targets) | **PATCH** /flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey} | Update, add, or delete expiring user targets on feature flag
*LaunchDarklyApi::FeatureFlagsApi* | [**patch_feature_flag**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#patch_feature_flag) | **PATCH** /flags/{projectKey}/{featureFlagKey} | Perform a partial update to a feature.
*LaunchDarklyApi::FeatureFlagsApi* | [**post_feature_flag**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagsApi.md#post_feature_flag) | **POST** /flags/{projectKey} | Creates a new feature flag.
*LaunchDarklyApi::ProjectsApi* | [**delete_project**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/ProjectsApi.md#delete_project) | **DELETE** /projects/{projectKey} | Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.
*LaunchDarklyApi::ProjectsApi* | [**get_project**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/ProjectsApi.md#get_project) | **GET** /projects/{projectKey} | Fetch a single project by key.
*LaunchDarklyApi::ProjectsApi* | [**get_projects**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/ProjectsApi.md#get_projects) | **GET** /projects | Returns a list of all projects in the account.
*LaunchDarklyApi::ProjectsApi* | [**patch_project**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/ProjectsApi.md#patch_project) | **PATCH** /projects/{projectKey} | Modify a project by ID.
*LaunchDarklyApi::ProjectsApi* | [**post_project**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/ProjectsApi.md#post_project) | **POST** /projects | Create a new project with the given key and name.
*LaunchDarklyApi::RootApi* | [**get_root**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/RootApi.md#get_root) | **GET** / | 
*LaunchDarklyApi::TeamMembersApi* | [**delete_member**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/TeamMembersApi.md#delete_member) | **DELETE** /members/{memberId} | Delete a team member by ID.
*LaunchDarklyApi::TeamMembersApi* | [**get_me**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/TeamMembersApi.md#get_me) | **GET** /members/me | Get the current team member associated with the token
*LaunchDarklyApi::TeamMembersApi* | [**get_member**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/TeamMembersApi.md#get_member) | **GET** /members/{memberId} | Get a single team member by ID.
*LaunchDarklyApi::TeamMembersApi* | [**get_members**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/TeamMembersApi.md#get_members) | **GET** /members | Returns a list of all members in the account.
*LaunchDarklyApi::TeamMembersApi* | [**patch_member**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/TeamMembersApi.md#patch_member) | **PATCH** /members/{memberId} | Modify a team member by ID.
*LaunchDarklyApi::TeamMembersApi* | [**post_members**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/TeamMembersApi.md#post_members) | **POST** /members | Invite new members.
*LaunchDarklyApi::UserSegmentsApi* | [**delete_user_segment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentsApi.md#delete_user_segment) | **DELETE** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Delete a user segment.
*LaunchDarklyApi::UserSegmentsApi* | [**get_expiring_user_targets_on_segment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentsApi.md#get_expiring_user_targets_on_segment) | **GET** /segments/{projectKey}/{userSegmentKey}/expiring-user-targets/{environmentKey} | Get expiring user targets for user segment
*LaunchDarklyApi::UserSegmentsApi* | [**get_user_segment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentsApi.md#get_user_segment) | **GET** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Get a single user segment by key.
*LaunchDarklyApi::UserSegmentsApi* | [**get_user_segments**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentsApi.md#get_user_segments) | **GET** /segments/{projectKey}/{environmentKey} | Get a list of all user segments in the given project.
*LaunchDarklyApi::UserSegmentsApi* | [**patch_expiring_user_targets_on_segment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentsApi.md#patch_expiring_user_targets_on_segment) | **PATCH** /segments/{projectKey}/{userSegmentKey}/expiring-user-targets/{environmentKey} | Update, add, or delete expiring user targets on user segment
*LaunchDarklyApi::UserSegmentsApi* | [**patch_user_segment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentsApi.md#patch_user_segment) | **PATCH** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Perform a partial update to a user segment.
*LaunchDarklyApi::UserSegmentsApi* | [**post_user_segment**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentsApi.md#post_user_segment) | **POST** /segments/{projectKey}/{environmentKey} | Creates a new user segment.
*LaunchDarklyApi::UserSettingsApi* | [**get_expiring_user_targets_for_user**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSettingsApi.md#get_expiring_user_targets_for_user) | **GET** /users/{projectKey}/{userKey}/expiring-user-targets/{environmentKey} | Get expiring dates on flags for user
*LaunchDarklyApi::UserSettingsApi* | [**get_user_flag_setting**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSettingsApi.md#get_user_flag_setting) | **GET** /users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Fetch a single flag setting for a user by key.
*LaunchDarklyApi::UserSettingsApi* | [**get_user_flag_settings**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSettingsApi.md#get_user_flag_settings) | **GET** /users/{projectKey}/{environmentKey}/{userKey}/flags | Fetch a single flag setting for a user by key.
*LaunchDarklyApi::UserSettingsApi* | [**patch_expiring_user_targets_for_flags**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSettingsApi.md#patch_expiring_user_targets_for_flags) | **PATCH** /users/{projectKey}/{userKey}/expiring-user-targets/{environmentKey} | Update, add, or delete expiring user targets for a single user on all flags
*LaunchDarklyApi::UserSettingsApi* | [**put_flag_setting**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSettingsApi.md#put_flag_setting) | **PUT** /users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Specifically enable or disable a feature flag for a user based on their key.
*LaunchDarklyApi::UsersApi* | [**delete_user**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UsersApi.md#delete_user) | **DELETE** /users/{projectKey}/{environmentKey}/{userKey} | Delete a user by ID.
*LaunchDarklyApi::UsersApi* | [**get_search_users**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UsersApi.md#get_search_users) | **GET** /user-search/{projectKey}/{environmentKey} | Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource.
*LaunchDarklyApi::UsersApi* | [**get_user**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UsersApi.md#get_user) | **GET** /users/{projectKey}/{environmentKey}/{userKey} | Get a user by key.
*LaunchDarklyApi::UsersApi* | [**get_users**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UsersApi.md#get_users) | **GET** /users/{projectKey}/{environmentKey} | List all users in the environment. Includes the total count of users. In each page, there will be up to 'limit' users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection.
*LaunchDarklyApi::WebhooksApi* | [**delete_webhook**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/WebhooksApi.md#delete_webhook) | **DELETE** /webhooks/{resourceId} | Delete a webhook by ID.
*LaunchDarklyApi::WebhooksApi* | [**get_webhook**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/WebhooksApi.md#get_webhook) | **GET** /webhooks/{resourceId} | Get a webhook by ID.
*LaunchDarklyApi::WebhooksApi* | [**get_webhooks**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/WebhooksApi.md#get_webhooks) | **GET** /webhooks | Fetch a list of all webhooks.
*LaunchDarklyApi::WebhooksApi* | [**patch_webhook**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/WebhooksApi.md#patch_webhook) | **PATCH** /webhooks/{resourceId} | Modify a webhook by ID.
*LaunchDarklyApi::WebhooksApi* | [**post_webhook**](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/WebhooksApi.md#post_webhook) | **POST** /webhooks | Create a webhook.


## Documentation for Models

 - [LaunchDarklyApi::AuditLogEntries](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/AuditLogEntries.md)
 - [LaunchDarklyApi::AuditLogEntry](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/AuditLogEntry.md)
 - [LaunchDarklyApi::AuditLogEntryTarget](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/AuditLogEntryTarget.md)
 - [LaunchDarklyApi::Clause](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Clause.md)
 - [LaunchDarklyApi::CopyActions](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CopyActions.md)
 - [LaunchDarklyApi::CustomProperty](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomProperty.md)
 - [LaunchDarklyApi::CustomPropertyValues](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomPropertyValues.md)
 - [LaunchDarklyApi::CustomRole](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomRole.md)
 - [LaunchDarklyApi::CustomRoleBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomRoleBody.md)
 - [LaunchDarklyApi::CustomRoles](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/CustomRoles.md)
 - [LaunchDarklyApi::Defaults](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Defaults.md)
 - [LaunchDarklyApi::Destination](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Destination.md)
 - [LaunchDarklyApi::DestinationAmazonKinesis](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DestinationAmazonKinesis.md)
 - [LaunchDarklyApi::DestinationBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DestinationBody.md)
 - [LaunchDarklyApi::DestinationGooglePubSub](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DestinationGooglePubSub.md)
 - [LaunchDarklyApi::DestinationMParticle](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DestinationMParticle.md)
 - [LaunchDarklyApi::DestinationSegment](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/DestinationSegment.md)
 - [LaunchDarklyApi::Destinations](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Destinations.md)
 - [LaunchDarklyApi::Environment](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Environment.md)
 - [LaunchDarklyApi::EnvironmentPost](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/EnvironmentPost.md)
 - [LaunchDarklyApi::EvaluationUsageError](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/EvaluationUsageError.md)
 - [LaunchDarklyApi::Events](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Events.md)
 - [LaunchDarklyApi::Fallthrough](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Fallthrough.md)
 - [LaunchDarklyApi::FeatureFlag](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlag.md)
 - [LaunchDarklyApi::FeatureFlagBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagBody.md)
 - [LaunchDarklyApi::FeatureFlagConfig](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagConfig.md)
 - [LaunchDarklyApi::FeatureFlagCopyBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagCopyBody.md)
 - [LaunchDarklyApi::FeatureFlagCopyObject](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagCopyObject.md)
 - [LaunchDarklyApi::FeatureFlagStatus](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagStatus.md)
 - [LaunchDarklyApi::FeatureFlagStatusAcrossEnvironments](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagStatusAcrossEnvironments.md)
 - [LaunchDarklyApi::FeatureFlagStatusForQueriedEnvironment](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagStatusForQueriedEnvironment.md)
 - [LaunchDarklyApi::FeatureFlagStatuses](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlagStatuses.md)
 - [LaunchDarklyApi::FeatureFlags](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FeatureFlags.md)
 - [LaunchDarklyApi::FlagListItem](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/FlagListItem.md)
 - [LaunchDarklyApi::Id](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Id.md)
 - [LaunchDarklyApi::Link](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Link.md)
 - [LaunchDarklyApi::Links](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Links.md)
 - [LaunchDarklyApi::MAU](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/MAU.md)
 - [LaunchDarklyApi::MAUMetadata](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/MAUMetadata.md)
 - [LaunchDarklyApi::MAUbyCategory](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/MAUbyCategory.md)
 - [LaunchDarklyApi::Member](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Member.md)
 - [LaunchDarklyApi::Members](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Members.md)
 - [LaunchDarklyApi::MembersBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/MembersBody.md)
 - [LaunchDarklyApi::PatchComment](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/PatchComment.md)
 - [LaunchDarklyApi::PatchOperation](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/PatchOperation.md)
 - [LaunchDarklyApi::Policy](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Policy.md)
 - [LaunchDarklyApi::Prerequisite](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Prerequisite.md)
 - [LaunchDarklyApi::Project](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Project.md)
 - [LaunchDarklyApi::ProjectBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/ProjectBody.md)
 - [LaunchDarklyApi::Projects](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Projects.md)
 - [LaunchDarklyApi::Role](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Role.md)
 - [LaunchDarklyApi::Rollout](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Rollout.md)
 - [LaunchDarklyApi::Rule](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Rule.md)
 - [LaunchDarklyApi::SemanticPatchOperation](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/SemanticPatchOperation.md)
 - [LaunchDarklyApi::SemanticPatchOperationInstructions](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/SemanticPatchOperationInstructions.md)
 - [LaunchDarklyApi::Site](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Site.md)
 - [LaunchDarklyApi::Statement](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Statement.md)
 - [LaunchDarklyApi::Stream](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Stream.md)
 - [LaunchDarklyApi::StreamBySDK](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamBySDK.md)
 - [LaunchDarklyApi::StreamBySDKLinks](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamBySDKLinks.md)
 - [LaunchDarklyApi::StreamBySDKLinksMetadata](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamBySDKLinksMetadata.md)
 - [LaunchDarklyApi::StreamLinks](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamLinks.md)
 - [LaunchDarklyApi::StreamSDKVersion](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamSDKVersion.md)
 - [LaunchDarklyApi::StreamSDKVersionData](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamSDKVersionData.md)
 - [LaunchDarklyApi::StreamUsageError](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamUsageError.md)
 - [LaunchDarklyApi::StreamUsageLinks](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamUsageLinks.md)
 - [LaunchDarklyApi::StreamUsageMetadata](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamUsageMetadata.md)
 - [LaunchDarklyApi::StreamUsageSeries](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/StreamUsageSeries.md)
 - [LaunchDarklyApi::Streams](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Streams.md)
 - [LaunchDarklyApi::Target](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Target.md)
 - [LaunchDarklyApi::Usage](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Usage.md)
 - [LaunchDarklyApi::UsageError](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UsageError.md)
 - [LaunchDarklyApi::UsageLinks](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UsageLinks.md)
 - [LaunchDarklyApi::User](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/User.md)
 - [LaunchDarklyApi::UserFlagSetting](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserFlagSetting.md)
 - [LaunchDarklyApi::UserFlagSettings](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserFlagSettings.md)
 - [LaunchDarklyApi::UserRecord](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserRecord.md)
 - [LaunchDarklyApi::UserSegment](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegment.md)
 - [LaunchDarklyApi::UserSegmentBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentBody.md)
 - [LaunchDarklyApi::UserSegmentRule](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegmentRule.md)
 - [LaunchDarklyApi::UserSegments](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSegments.md)
 - [LaunchDarklyApi::UserSettingsBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserSettingsBody.md)
 - [LaunchDarklyApi::UserTargetingExpirationForFlag](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserTargetingExpirationForFlag.md)
 - [LaunchDarklyApi::UserTargetingExpirationForFlags](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserTargetingExpirationForFlags.md)
 - [LaunchDarklyApi::UserTargetingExpirationForSegment](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserTargetingExpirationForSegment.md)
 - [LaunchDarklyApi::UserTargetingExpirationOnFlagsForUser](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserTargetingExpirationOnFlagsForUser.md)
 - [LaunchDarklyApi::UserTargetingExpirationResourceIdForFlag](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/UserTargetingExpirationResourceIdForFlag.md)
 - [LaunchDarklyApi::Users](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Users.md)
 - [LaunchDarklyApi::Variation](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Variation.md)
 - [LaunchDarklyApi::Webhook](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Webhook.md)
 - [LaunchDarklyApi::WebhookBody](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/WebhookBody.md)
 - [LaunchDarklyApi::Webhooks](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/Webhooks.md)
 - [LaunchDarklyApi::WeightedVariation](https://github.com/launchdarkly/api-client-ruby/blob/3.3.1/docs/WeightedVariation.md)

## Sample Code

```
# Load the gem
require 'launchdarkly_api'

# Setup authorization
LaunchDarklyApi.configure do |config|
  config.api_key['Authorization'] = ENV['LD_API_KEY']
end

api_instance = LaunchDarklyApi::FeatureFlagsApi.new

project_key = "openapi"
flag_key = "test-ruby"

# Create a flag with a json variations
body = LaunchDarklyApi::FeatureFlagBody.new(
  name: "test-ruby",
  key: flag_key,
  variations: [
    LaunchDarklyApi::Variation.new(value=[1,2]),
    LaunchDarklyApi::Variation.new(value=[3,4]),
    LaunchDarklyApi::Variation.new(value=[5]),
  ])

begin
  result = api_instance.post_feature_flag(project_key, body)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Exception creating feature flag: #{e}"
end

# Clean up new flag
begin
  result = api_instance.delete_feature_flag(project_key, flag_key)
  p result
rescue LaunchDarklyApi::ApiError => e
  puts "Exception deleting feature flag: #{e}"
end```
