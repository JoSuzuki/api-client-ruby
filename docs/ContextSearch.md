# LaunchDarklyApi::ContextSearch

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **filter** | **String** | A collection of context filters | [optional] |
| **sort** | **String** | Specifies a field by which to sort. LaunchDarkly supports sorting by timestamp in ascending order by specifying &lt;code&gt;ts&lt;/code&gt; for this value, or descending order by specifying &lt;code&gt;-ts&lt;/code&gt;. | [optional] |
| **limit** | **Integer** | Specifies the maximum number of items in the collection to return (max: 50, default: 20) | [optional] |
| **continuation_token** | **String** | Limits results to contexts with sort values after the value specified. You can use this for pagination, however, we recommend using the &lt;code&gt;next&lt;/code&gt; link instead, because this value is an obfuscated string. | [optional] |

## Example

```ruby
require 'launchdarkly_api'

instance = LaunchDarklyApi::ContextSearch.new(
  filter: user.firstName:{&quot;startsWith&quot;: &quot;Jo&quot;},kind:{&quot;anyOf&quot;: [&quot;user&quot;,&quot;organization&quot;]},
  sort: -ts,
  limit: 10,
  continuation_token: QAGFKH1313KUGI2351
)
```

