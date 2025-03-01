# LaunchDarklyApi::ContextInstanceSegmentMembership

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | A human-friendly name for the segment |  |
| **key** | **String** | A unique key used to reference the segment |  |
| **description** | **String** | A description of the segment&#39;s purpose |  |
| **unbounded** | **Boolean** | Whether this is an unbounded/big segment |  |
| **external** | **String** | If the segment is a Synced Segment the name of the external source&#39; |  |
| **is_member** | **Boolean** | Whether the context is a member of this segment, either by explicit inclusion or by rule matching |  |
| **is_individually_targeted** | **Boolean** | Whether the context is explicitly included in this segment |  |
| **is_rule_targeted** | **Boolean** | Whether the context is captured by this segment&#39;s rules. The value of this field is undefined if the context is also explicitly included (isIndividuallyTargeted &#x3D; true). |  |
| **_links** | [**Hash&lt;String, Link&gt;**](Link.md) |  |  |

## Example

```ruby
require 'launchdarkly_api'

instance = LaunchDarklyApi::ContextInstanceSegmentMembership.new(
  name: Segment Name,
  key: segment-key-123abc,
  description: Segment description,
  unbounded: false,
  external: https://amplitude.com/myCohort,
  is_member: true,
  is_individually_targeted: true,
  is_rule_targeted: false,
  _links: null
)
```

