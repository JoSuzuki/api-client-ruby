# LaunchDarklyApi::MetricInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** | The metric key |  |
| **primary** | **Boolean** | Whether this is a primary metric (true) or a secondary metric (false) |  |

## Example

```ruby
require 'launchdarkly_api'

instance = LaunchDarklyApi::MetricInput.new(
  key: metric-key-123abc,
  primary: true
)
```

