# LaunchDarklyApi::ExperimentationSettingsPut

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **randomization_units** | [**Array&lt;RandomizationUnitInput&gt;**](RandomizationUnitInput.md) | An array of randomization units allowed for this project. |  |

## Example

```ruby
require 'launchdarkly_api'

instance = LaunchDarklyApi::ExperimentationSettingsPut.new(
  randomization_units: null
)
```

