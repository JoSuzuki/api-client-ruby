# LaunchDarklyApi::MemberPermissionGrantSummaryRep

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action_set** | **String** | The name of the a group of related actions to allow. A permission grant may have either an &lt;code&gt;actionSet&lt;/code&gt; or a list of &lt;code&gt;actions&lt;/code&gt; but not both at the same time. |  |
| **actions** | **Array&lt;String&gt;** | A list of actions to allow |  |
| **resource** | **String** | The resource for which the &lt;code&gt;actions&lt;/code&gt; are allowed |  |

## Example

```ruby
require 'launchdarkly_api'

instance = LaunchDarklyApi::MemberPermissionGrantSummaryRep.new(
  action_set: null,
  actions: [&quot;maintainTeam&quot;],
  resource: team/qa-team
)
```

