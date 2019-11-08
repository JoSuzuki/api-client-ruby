=begin
#LaunchDarkly REST API

#Build custom integrations with the LaunchDarkly REST API

OpenAPI spec version: 2.0.21
Contact: support@launchdarkly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.0

=end

require 'date'

module LaunchDarklyApi
  class Role
    
    WRITER = 'writer'.freeze
    READER = 'reader'.freeze
    ADMIN = 'admin'.freeze
    OWNER = 'owner'.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = Role.constants.select { |c| Role::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #Role" if constantValues.empty?
      value
    end
  end
end
