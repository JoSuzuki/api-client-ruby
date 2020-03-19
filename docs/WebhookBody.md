# LaunchDarklyApi::WebhookBody

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**url** | **String** | The URL of the remote webhook. | 
**secret** | **String** | If sign is true, and the secret attribute is omitted, LaunchDarkly will automatically generate a secret for you. | [optional] 
**sign** | **BOOLEAN** | If sign is false, the webhook will not include a signature header, and the secret can be omitted. | 
**on** | **BOOLEAN** | Whether this webhook is enabled or not. | 
**name** | **String** | The name of the webhook. | [optional] 
**statements** | [**Array&lt;Statement&gt;**](Statement.md) |  | [optional] 
**tags** | **Array&lt;String&gt;** | Tags for the webhook. | [optional] 


