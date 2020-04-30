=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 3.1.0
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.8

=end

# Common files
require 'launchdarkly_api/api_client'
require 'launchdarkly_api/api_error'
require 'launchdarkly_api/version'
require 'launchdarkly_api/configuration'

# Models
require 'launchdarkly_api/models/audit_log_entries'
require 'launchdarkly_api/models/audit_log_entry'
require 'launchdarkly_api/models/audit_log_entry_target'
require 'launchdarkly_api/models/clause'
require 'launchdarkly_api/models/copy_actions'
require 'launchdarkly_api/models/custom_property'
require 'launchdarkly_api/models/custom_property_values'
require 'launchdarkly_api/models/custom_role'
require 'launchdarkly_api/models/custom_role_body'
require 'launchdarkly_api/models/custom_roles'
require 'launchdarkly_api/models/defaults'
require 'launchdarkly_api/models/destination'
require 'launchdarkly_api/models/destination_amazon_kinesis'
require 'launchdarkly_api/models/destination_body'
require 'launchdarkly_api/models/destination_google_pub_sub'
require 'launchdarkly_api/models/destination_m_particle'
require 'launchdarkly_api/models/destination_segment'
require 'launchdarkly_api/models/destinations'
require 'launchdarkly_api/models/environment'
require 'launchdarkly_api/models/environment_post'
require 'launchdarkly_api/models/evaluation_usage_error'
require 'launchdarkly_api/models/events'
require 'launchdarkly_api/models/fallthrough'
require 'launchdarkly_api/models/feature_flag'
require 'launchdarkly_api/models/feature_flag_body'
require 'launchdarkly_api/models/feature_flag_config'
require 'launchdarkly_api/models/feature_flag_copy_body'
require 'launchdarkly_api/models/feature_flag_copy_object'
require 'launchdarkly_api/models/feature_flag_status'
require 'launchdarkly_api/models/feature_flag_status_across_environments'
require 'launchdarkly_api/models/feature_flag_status_for_queried_environment'
require 'launchdarkly_api/models/feature_flag_statuses'
require 'launchdarkly_api/models/feature_flags'
require 'launchdarkly_api/models/flag_list_item'
require 'launchdarkly_api/models/id'
require 'launchdarkly_api/models/link'
require 'launchdarkly_api/models/links'
require 'launchdarkly_api/models/mau'
require 'launchdarkly_api/models/mau_metadata'
require 'launchdarkly_api/models/ma_uby_category'
require 'launchdarkly_api/models/member'
require 'launchdarkly_api/models/members'
require 'launchdarkly_api/models/members_body'
require 'launchdarkly_api/models/patch_comment'
require 'launchdarkly_api/models/patch_operation'
require 'launchdarkly_api/models/policy'
require 'launchdarkly_api/models/prerequisite'
require 'launchdarkly_api/models/project'
require 'launchdarkly_api/models/project_body'
require 'launchdarkly_api/models/projects'
require 'launchdarkly_api/models/role'
require 'launchdarkly_api/models/rollout'
require 'launchdarkly_api/models/rule'
require 'launchdarkly_api/models/site'
require 'launchdarkly_api/models/statement'
require 'launchdarkly_api/models/stream'
require 'launchdarkly_api/models/stream_by_sdk'
require 'launchdarkly_api/models/stream_by_sdk_links'
require 'launchdarkly_api/models/stream_by_sdk_links_metadata'
require 'launchdarkly_api/models/stream_links'
require 'launchdarkly_api/models/stream_sdk_version'
require 'launchdarkly_api/models/stream_sdk_version_data'
require 'launchdarkly_api/models/stream_usage_error'
require 'launchdarkly_api/models/stream_usage_links'
require 'launchdarkly_api/models/stream_usage_metadata'
require 'launchdarkly_api/models/stream_usage_series'
require 'launchdarkly_api/models/streams'
require 'launchdarkly_api/models/target'
require 'launchdarkly_api/models/usage'
require 'launchdarkly_api/models/usage_error'
require 'launchdarkly_api/models/usage_links'
require 'launchdarkly_api/models/user'
require 'launchdarkly_api/models/user_flag_setting'
require 'launchdarkly_api/models/user_flag_settings'
require 'launchdarkly_api/models/user_record'
require 'launchdarkly_api/models/user_segment'
require 'launchdarkly_api/models/user_segment_body'
require 'launchdarkly_api/models/user_segment_rule'
require 'launchdarkly_api/models/user_segments'
require 'launchdarkly_api/models/user_settings_body'
require 'launchdarkly_api/models/user_targeting_expiration_for_flag'
require 'launchdarkly_api/models/user_targeting_expiration_for_flags'
require 'launchdarkly_api/models/user_targeting_expiration_on_flags_for_user'
require 'launchdarkly_api/models/user_targeting_expiration_resource_id_for_flag'
require 'launchdarkly_api/models/users'
require 'launchdarkly_api/models/variation'
require 'launchdarkly_api/models/webhook'
require 'launchdarkly_api/models/webhook_body'
require 'launchdarkly_api/models/webhooks'
require 'launchdarkly_api/models/weighted_variation'

# APIs
require 'launchdarkly_api/api/audit_log_api'
require 'launchdarkly_api/api/custom_roles_api'
require 'launchdarkly_api/api/customer_metrics_api'
require 'launchdarkly_api/api/data_export_destinations_api'
require 'launchdarkly_api/api/environments_api'
require 'launchdarkly_api/api/feature_flags_api'
require 'launchdarkly_api/api/projects_api'
require 'launchdarkly_api/api/root_api'
require 'launchdarkly_api/api/team_members_api'
require 'launchdarkly_api/api/user_segments_api'
require 'launchdarkly_api/api/user_settings_api'
require 'launchdarkly_api/api/users_api'
require 'launchdarkly_api/api/webhooks_api'

module LaunchDarklyApi
  class << self
    # Customize default settings for the SDK using block.
    #   LaunchDarklyApi.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
