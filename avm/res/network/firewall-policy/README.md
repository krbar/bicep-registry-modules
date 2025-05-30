# Firewall Policies `[Microsoft.Network/firewallPolicies]`

This module deploys a Firewall Policy.

## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)
- [Data Collection](#Data-Collection)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/locks` | [2020-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2020-05-01/locks) |
| `Microsoft.Authorization/roleAssignments` | [2022-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments) |
| `Microsoft.Network/firewallPolicies` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/firewallPolicies) |
| `Microsoft.Network/firewallPolicies/ruleCollectionGroups` | [2023-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-04-01/firewallPolicies/ruleCollectionGroups) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br/public:avm/res/network/firewall-policy:<version>`.

- [Using only defaults](#example-1-using-only-defaults)
- [Using large parameter set](#example-2-using-large-parameter-set)
- [WAF-aligned](#example-3-waf-aligned)

### Example 1: _Using only defaults_

This instance deploys the module with the minimum set of required parameters.


<details>

<summary>via Bicep module</summary>

```bicep
module firewallPolicy 'br/public:avm/res/network/firewall-policy:<version>' = {
  name: 'firewallPolicyDeployment'
  params: {
    name: 'nfpmin001'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "name": {
      "value": "nfpmin001"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/network/firewall-policy:<version>'

param name = 'nfpmin001'
```

</details>
<p>

### Example 2: _Using large parameter set_

This instance deploys the module with most of its features enabled.


<details>

<summary>via Bicep module</summary>

```bicep
module firewallPolicy 'br/public:avm/res/network/firewall-policy:<version>' = {
  name: 'firewallPolicyDeployment'
  params: {
    // Required parameters
    name: 'nfpmax001'
    // Non-required parameters
    allowSqlRedirect: true
    intrusionDetection: {
      mode: 'Alert'
    }
    location: '<location>'
    lock: {
      kind: 'CanNotDelete'
      name: 'myCustomLockName'
    }
    managedIdentities: {
      userAssignedResourceIds: [
        '<managedIdentityResourceId>'
      ]
    }
    roleAssignments: [
      {
        name: 'c1c7fa14-5a90-4932-8781-fa91318b8858'
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Owner'
      }
      {
        name: '<name>'
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: '<roleDefinitionIdOrName>'
      }
    ]
    ruleCollectionGroups: [
      {
        name: 'rule-001'
        priority: 5000
        ruleCollections: [
          {
            action: {
              type: 'Allow'
            }
            name: 'collection002'
            priority: 5555
            ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
            rules: [
              {
                destinationAddresses: [
                  '*'
                ]
                destinationFqdns: []
                destinationIpGroups: []
                destinationPorts: [
                  '80'
                ]
                ipProtocols: [
                  'TCP'
                  'UDP'
                ]
                name: 'rule002'
                ruleType: 'NetworkRule'
                sourceAddresses: [
                  '*'
                ]
                sourceIpGroups: []
              }
            ]
          }
        ]
      }
    ]
    snat: {
      autoLearnPrivateRanges: 'Enabled'
    }
    tags: {
      Environment: 'Non-Prod'
      'hidden-title': 'This is visible in the resource name'
      Role: 'DeploymentValidation'
    }
    tier: 'Premium'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "name": {
      "value": "nfpmax001"
    },
    // Non-required parameters
    "allowSqlRedirect": {
      "value": true
    },
    "intrusionDetection": {
      "value": {
        "mode": "Alert"
      }
    },
    "location": {
      "value": "<location>"
    },
    "lock": {
      "value": {
        "kind": "CanNotDelete",
        "name": "myCustomLockName"
      }
    },
    "managedIdentities": {
      "value": {
        "userAssignedResourceIds": [
          "<managedIdentityResourceId>"
        ]
      }
    },
    "roleAssignments": {
      "value": [
        {
          "name": "c1c7fa14-5a90-4932-8781-fa91318b8858",
          "principalId": "<principalId>",
          "principalType": "ServicePrincipal",
          "roleDefinitionIdOrName": "Owner"
        },
        {
          "name": "<name>",
          "principalId": "<principalId>",
          "principalType": "ServicePrincipal",
          "roleDefinitionIdOrName": "b24988ac-6180-42a0-ab88-20f7382dd24c"
        },
        {
          "principalId": "<principalId>",
          "principalType": "ServicePrincipal",
          "roleDefinitionIdOrName": "<roleDefinitionIdOrName>"
        }
      ]
    },
    "ruleCollectionGroups": {
      "value": [
        {
          "name": "rule-001",
          "priority": 5000,
          "ruleCollections": [
            {
              "action": {
                "type": "Allow"
              },
              "name": "collection002",
              "priority": 5555,
              "ruleCollectionType": "FirewallPolicyFilterRuleCollection",
              "rules": [
                {
                  "destinationAddresses": [
                    "*"
                  ],
                  "destinationFqdns": [],
                  "destinationIpGroups": [],
                  "destinationPorts": [
                    "80"
                  ],
                  "ipProtocols": [
                    "TCP",
                    "UDP"
                  ],
                  "name": "rule002",
                  "ruleType": "NetworkRule",
                  "sourceAddresses": [
                    "*"
                  ],
                  "sourceIpGroups": []
                }
              ]
            }
          ]
        }
      ]
    },
    "snat": {
      "value": {
        "autoLearnPrivateRanges": "Enabled"
      }
    },
    "tags": {
      "value": {
        "Environment": "Non-Prod",
        "hidden-title": "This is visible in the resource name",
        "Role": "DeploymentValidation"
      }
    },
    "tier": {
      "value": "Premium"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/network/firewall-policy:<version>'

// Required parameters
param name = 'nfpmax001'
// Non-required parameters
param allowSqlRedirect = true
param intrusionDetection = {
  mode: 'Alert'
}
param location = '<location>'
param lock = {
  kind: 'CanNotDelete'
  name: 'myCustomLockName'
}
param managedIdentities = {
  userAssignedResourceIds: [
    '<managedIdentityResourceId>'
  ]
}
param roleAssignments = [
  {
    name: 'c1c7fa14-5a90-4932-8781-fa91318b8858'
    principalId: '<principalId>'
    principalType: 'ServicePrincipal'
    roleDefinitionIdOrName: 'Owner'
  }
  {
    name: '<name>'
    principalId: '<principalId>'
    principalType: 'ServicePrincipal'
    roleDefinitionIdOrName: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
  }
  {
    principalId: '<principalId>'
    principalType: 'ServicePrincipal'
    roleDefinitionIdOrName: '<roleDefinitionIdOrName>'
  }
]
param ruleCollectionGroups = [
  {
    name: 'rule-001'
    priority: 5000
    ruleCollections: [
      {
        action: {
          type: 'Allow'
        }
        name: 'collection002'
        priority: 5555
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        rules: [
          {
            destinationAddresses: [
              '*'
            ]
            destinationFqdns: []
            destinationIpGroups: []
            destinationPorts: [
              '80'
            ]
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            name: 'rule002'
            ruleType: 'NetworkRule'
            sourceAddresses: [
              '*'
            ]
            sourceIpGroups: []
          }
        ]
      }
    ]
  }
]
param snat = {
  autoLearnPrivateRanges: 'Enabled'
}
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
param tier = 'Premium'
```

</details>
<p>

### Example 3: _WAF-aligned_

This instance deploys the module in alignment with the best-practices of the Azure Well-Architected Framework.


<details>

<summary>via Bicep module</summary>

```bicep
module firewallPolicy 'br/public:avm/res/network/firewall-policy:<version>' = {
  name: 'firewallPolicyDeployment'
  params: {
    // Required parameters
    name: 'nfpwaf001'
    // Non-required parameters
    allowSqlRedirect: true
    ruleCollectionGroups: [
      {
        name: 'rule-001'
        priority: 5000
        ruleCollections: [
          {
            action: {
              type: 'Allow'
            }
            name: 'collection002'
            priority: 5555
            ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
            rules: [
              {
                destinationAddresses: [
                  '*'
                ]
                destinationFqdns: []
                destinationIpGroups: []
                destinationPorts: [
                  '80'
                ]
                ipProtocols: [
                  'TCP'
                  'UDP'
                ]
                name: 'rule002'
                ruleType: 'NetworkRule'
                sourceAddresses: [
                  '*'
                ]
                sourceIpGroups: []
              }
            ]
          }
        ]
      }
    ]
    snat: {
      autoLearnPrivateRanges: 'Enabled'
    }
    tags: {
      Environment: 'Non-Prod'
      'hidden-title': 'This is visible in the resource name'
      Role: 'DeploymentValidation'
    }
    threatIntelMode: 'Deny'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "name": {
      "value": "nfpwaf001"
    },
    // Non-required parameters
    "allowSqlRedirect": {
      "value": true
    },
    "ruleCollectionGroups": {
      "value": [
        {
          "name": "rule-001",
          "priority": 5000,
          "ruleCollections": [
            {
              "action": {
                "type": "Allow"
              },
              "name": "collection002",
              "priority": 5555,
              "ruleCollectionType": "FirewallPolicyFilterRuleCollection",
              "rules": [
                {
                  "destinationAddresses": [
                    "*"
                  ],
                  "destinationFqdns": [],
                  "destinationIpGroups": [],
                  "destinationPorts": [
                    "80"
                  ],
                  "ipProtocols": [
                    "TCP",
                    "UDP"
                  ],
                  "name": "rule002",
                  "ruleType": "NetworkRule",
                  "sourceAddresses": [
                    "*"
                  ],
                  "sourceIpGroups": []
                }
              ]
            }
          ]
        }
      ]
    },
    "snat": {
      "value": {
        "autoLearnPrivateRanges": "Enabled"
      }
    },
    "tags": {
      "value": {
        "Environment": "Non-Prod",
        "hidden-title": "This is visible in the resource name",
        "Role": "DeploymentValidation"
      }
    },
    "threatIntelMode": {
      "value": "Deny"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/network/firewall-policy:<version>'

// Required parameters
param name = 'nfpwaf001'
// Non-required parameters
param allowSqlRedirect = true
param ruleCollectionGroups = [
  {
    name: 'rule-001'
    priority: 5000
    ruleCollections: [
      {
        action: {
          type: 'Allow'
        }
        name: 'collection002'
        priority: 5555
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        rules: [
          {
            destinationAddresses: [
              '*'
            ]
            destinationFqdns: []
            destinationIpGroups: []
            destinationPorts: [
              '80'
            ]
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            name: 'rule002'
            ruleType: 'NetworkRule'
            sourceAddresses: [
              '*'
            ]
            sourceIpGroups: []
          }
        ]
      }
    ]
  }
]
param snat = {
  autoLearnPrivateRanges: 'Enabled'
}
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
param threatIntelMode = 'Deny'
```

</details>
<p>

## Parameters

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-name) | string | Name of the Firewall Policy. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allowSqlRedirect`](#parameter-allowsqlredirect) | bool | A flag to indicate if SQL Redirect traffic filtering is enabled. Turning on the flag requires no rule using port 11000-11999. |
| [`basePolicyResourceId`](#parameter-basepolicyresourceid) | string | Resource ID of the base policy. |
| [`certificateName`](#parameter-certificatename) | string | Name of the CA certificate. |
| [`defaultWorkspaceResourceId`](#parameter-defaultworkspaceresourceid) | string | Default Log Analytics Resource ID for Firewall Policy Insights. |
| [`enableProxy`](#parameter-enableproxy) | bool | Enable DNS Proxy on Firewalls attached to the Firewall Policy. |
| [`enableTelemetry`](#parameter-enabletelemetry) | bool | Enable/Disable usage telemetry for module. |
| [`fqdns`](#parameter-fqdns) | array | List of FQDNs for the ThreatIntel Allowlist. |
| [`insightsIsEnabled`](#parameter-insightsisenabled) | bool | A flag to indicate if the insights are enabled on the policy. |
| [`intrusionDetection`](#parameter-intrusiondetection) | object | The configuration for Intrusion detection. |
| [`ipAddresses`](#parameter-ipaddresses) | array | List of IP addresses for the ThreatIntel Allowlist. |
| [`keyVaultSecretId`](#parameter-keyvaultsecretid) | string | Secret ID of (base-64 encoded unencrypted PFX) Secret or Certificate object stored in KeyVault. |
| [`location`](#parameter-location) | string | Location for all resources. |
| [`lock`](#parameter-lock) | object | The lock settings of the service. |
| [`managedIdentities`](#parameter-managedidentities) | object | The managed identity definition for this resource. |
| [`retentionDays`](#parameter-retentiondays) | int | Number of days the insights should be enabled on the policy. |
| [`roleAssignments`](#parameter-roleassignments) | array | Array of role assignments to create. |
| [`ruleCollectionGroups`](#parameter-rulecollectiongroups) | array | Rule collection groups. |
| [`servers`](#parameter-servers) | array | List of Custom DNS Servers. |
| [`snat`](#parameter-snat) | object | The private IP addresses/IP ranges to which traffic will not be SNAT. |
| [`tags`](#parameter-tags) | object | Tags of the Firewall policy resource. |
| [`threatIntelMode`](#parameter-threatintelmode) | string | The operation mode for Threat Intel. |
| [`tier`](#parameter-tier) | string | Tier of Firewall Policy. |
| [`workspaces`](#parameter-workspaces) | array | List of workspaces for Firewall Policy Insights. |

### Parameter: `name`

Name of the Firewall Policy.

- Required: Yes
- Type: string

### Parameter: `allowSqlRedirect`

A flag to indicate if SQL Redirect traffic filtering is enabled. Turning on the flag requires no rule using port 11000-11999.

- Required: No
- Type: bool
- Default: `False`

### Parameter: `basePolicyResourceId`

Resource ID of the base policy.

- Required: No
- Type: string

### Parameter: `certificateName`

Name of the CA certificate.

- Required: No
- Type: string

### Parameter: `defaultWorkspaceResourceId`

Default Log Analytics Resource ID for Firewall Policy Insights.

- Required: No
- Type: string

### Parameter: `enableProxy`

Enable DNS Proxy on Firewalls attached to the Firewall Policy.

- Required: No
- Type: bool
- Default: `False`

### Parameter: `enableTelemetry`

Enable/Disable usage telemetry for module.

- Required: No
- Type: bool
- Default: `True`

### Parameter: `fqdns`

List of FQDNs for the ThreatIntel Allowlist.

- Required: No
- Type: array

### Parameter: `insightsIsEnabled`

A flag to indicate if the insights are enabled on the policy.

- Required: No
- Type: bool
- Default: `False`

### Parameter: `intrusionDetection`

The configuration for Intrusion detection.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`configuration`](#parameter-intrusiondetectionconfiguration) | object | Intrusion detection configuration properties. |
| [`mode`](#parameter-intrusiondetectionmode) | string | Intrusion detection general state. When attached to a parent policy, the firewall's effective IDPS mode is the stricter mode of the two. |
| [`profile`](#parameter-intrusiondetectionprofile) | string | IDPS profile name. When attached to a parent policy, the firewall's effective profile is the profile name of the parent policy. |

### Parameter: `intrusionDetection.configuration`

Intrusion detection configuration properties.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`bypassTrafficSettings`](#parameter-intrusiondetectionconfigurationbypasstrafficsettings) | array | List of rules for traffic to bypass. |
| [`privateRanges`](#parameter-intrusiondetectionconfigurationprivateranges) | array | IDPS Private IP address ranges are used to identify traffic direction (i.e. inbound, outbound, etc.). By default, only ranges defined by IANA RFC 1918 are considered private IP addresses. To modify default ranges, specify your Private IP address ranges with this property. |
| [`signatureOverrides`](#parameter-intrusiondetectionconfigurationsignatureoverrides) | array | List of specific signatures states. |

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings`

List of rules for traffic to bypass.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-intrusiondetectionconfigurationbypasstrafficsettingsname) | string | Name of the bypass traffic rule. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-intrusiondetectionconfigurationbypasstrafficsettingsdescription) | string | Description of the bypass traffic rule. |
| [`destinationAddresses`](#parameter-intrusiondetectionconfigurationbypasstrafficsettingsdestinationaddresses) | array | List of destination IP addresses or ranges for this rule. |
| [`destinationIpGroups`](#parameter-intrusiondetectionconfigurationbypasstrafficsettingsdestinationipgroups) | array | List of destination IpGroups for this rule. |
| [`destinationPorts`](#parameter-intrusiondetectionconfigurationbypasstrafficsettingsdestinationports) | array | List of destination ports or ranges. |
| [`protocol`](#parameter-intrusiondetectionconfigurationbypasstrafficsettingsprotocol) | string | The rule bypass protocol. |
| [`sourceAddresses`](#parameter-intrusiondetectionconfigurationbypasstrafficsettingssourceaddresses) | array | List of source IP addresses or ranges for this rule. |
| [`sourceIpGroups`](#parameter-intrusiondetectionconfigurationbypasstrafficsettingssourceipgroups) | array | List of source IpGroups for this rule. |

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings.name`

Name of the bypass traffic rule.

- Required: Yes
- Type: string

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings.description`

Description of the bypass traffic rule.

- Required: No
- Type: string

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings.destinationAddresses`

List of destination IP addresses or ranges for this rule.

- Required: No
- Type: array

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings.destinationIpGroups`

List of destination IpGroups for this rule.

- Required: No
- Type: array

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings.destinationPorts`

List of destination ports or ranges.

- Required: No
- Type: array

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings.protocol`

The rule bypass protocol.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'ANY'
    'ICMP'
    'TCP'
    'UDP'
  ]
  ```

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings.sourceAddresses`

List of source IP addresses or ranges for this rule.

- Required: No
- Type: array

### Parameter: `intrusionDetection.configuration.bypassTrafficSettings.sourceIpGroups`

List of source IpGroups for this rule.

- Required: No
- Type: array

### Parameter: `intrusionDetection.configuration.privateRanges`

IDPS Private IP address ranges are used to identify traffic direction (i.e. inbound, outbound, etc.). By default, only ranges defined by IANA RFC 1918 are considered private IP addresses. To modify default ranges, specify your Private IP address ranges with this property.

- Required: No
- Type: array

### Parameter: `intrusionDetection.configuration.signatureOverrides`

List of specific signatures states.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`id`](#parameter-intrusiondetectionconfigurationsignatureoverridesid) | string | The signature id. |
| [`mode`](#parameter-intrusiondetectionconfigurationsignatureoverridesmode) | string | The signature state. |

### Parameter: `intrusionDetection.configuration.signatureOverrides.id`

The signature id.

- Required: Yes
- Type: string

### Parameter: `intrusionDetection.configuration.signatureOverrides.mode`

The signature state.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Alert'
    'Deny'
    'Off'
  ]
  ```

### Parameter: `intrusionDetection.mode`

Intrusion detection general state. When attached to a parent policy, the firewall's effective IDPS mode is the stricter mode of the two.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Alert'
    'Deny'
    'Off'
  ]
  ```

### Parameter: `intrusionDetection.profile`

IDPS profile name. When attached to a parent policy, the firewall's effective profile is the profile name of the parent policy.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Advanced'
    'Basic'
    'Extended'
    'Standard'
  ]
  ```

### Parameter: `ipAddresses`

List of IP addresses for the ThreatIntel Allowlist.

- Required: No
- Type: array

### Parameter: `keyVaultSecretId`

Secret ID of (base-64 encoded unencrypted PFX) Secret or Certificate object stored in KeyVault.

- Required: No
- Type: string

### Parameter: `location`

Location for all resources.

- Required: No
- Type: string
- Default: `[resourceGroup().location]`

### Parameter: `lock`

The lock settings of the service.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-lockkind) | string | Specify the type of lock. |
| [`name`](#parameter-lockname) | string | Specify the name of lock. |

### Parameter: `lock.kind`

Specify the type of lock.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `lock.name`

Specify the name of lock.

- Required: No
- Type: string

### Parameter: `managedIdentities`

The managed identity definition for this resource.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`userAssignedResourceIds`](#parameter-managedidentitiesuserassignedresourceids) | array | The resource ID(s) to assign to the resource. Required if a user assigned identity is used for encryption. |

### Parameter: `managedIdentities.userAssignedResourceIds`

The resource ID(s) to assign to the resource. Required if a user assigned identity is used for encryption.

- Required: No
- Type: array

### Parameter: `retentionDays`

Number of days the insights should be enabled on the policy.

- Required: No
- Type: int
- Default: `365`

### Parameter: `roleAssignments`

Array of role assignments to create.

- Required: No
- Type: array
- Roles configurable by name:
  - `'Contributor'`
  - `'Owner'`
  - `'Reader'`
  - `'Role Based Access Control Administrator'`
  - `'User Access Administrator'`

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-roleassignmentsprincipalid) | string | The principal ID of the principal (user/group/identity) to assign the role to. |
| [`roleDefinitionIdOrName`](#parameter-roleassignmentsroledefinitionidorname) | string | The role to assign. You can provide either the display name of the role definition, the role definition GUID, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-roleassignmentscondition) | string | The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase "foo_storage_container". |
| [`conditionVersion`](#parameter-roleassignmentsconditionversion) | string | Version of the condition. |
| [`delegatedManagedIdentityResourceId`](#parameter-roleassignmentsdelegatedmanagedidentityresourceid) | string | The Resource Id of the delegated managed identity resource. |
| [`description`](#parameter-roleassignmentsdescription) | string | The description of the role assignment. |
| [`name`](#parameter-roleassignmentsname) | string | The name (as GUID) of the role assignment. If not provided, a GUID will be generated. |
| [`principalType`](#parameter-roleassignmentsprincipaltype) | string | The principal type of the assigned principal ID. |

### Parameter: `roleAssignments.principalId`

The principal ID of the principal (user/group/identity) to assign the role to.

- Required: Yes
- Type: string

### Parameter: `roleAssignments.roleDefinitionIdOrName`

The role to assign. You can provide either the display name of the role definition, the role definition GUID, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'.

- Required: Yes
- Type: string

### Parameter: `roleAssignments.condition`

The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase "foo_storage_container".

- Required: No
- Type: string

### Parameter: `roleAssignments.conditionVersion`

Version of the condition.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `roleAssignments.delegatedManagedIdentityResourceId`

The Resource Id of the delegated managed identity resource.

- Required: No
- Type: string

### Parameter: `roleAssignments.description`

The description of the role assignment.

- Required: No
- Type: string

### Parameter: `roleAssignments.name`

The name (as GUID) of the role assignment. If not provided, a GUID will be generated.

- Required: No
- Type: string

### Parameter: `roleAssignments.principalType`

The principal type of the assigned principal ID.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `ruleCollectionGroups`

Rule collection groups.

- Required: No
- Type: array

### Parameter: `servers`

List of Custom DNS Servers.

- Required: No
- Type: array

### Parameter: `snat`

The private IP addresses/IP ranges to which traffic will not be SNAT.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`autoLearnPrivateRanges`](#parameter-snatautolearnprivateranges) | string | The operation mode for automatically learning private ranges to not be SNAT. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`privateRanges`](#parameter-snatprivateranges) | array | List of private IP addresses/IP address ranges to not be SNAT. |

### Parameter: `snat.autoLearnPrivateRanges`

The operation mode for automatically learning private ranges to not be SNAT.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `snat.privateRanges`

List of private IP addresses/IP address ranges to not be SNAT.

- Required: No
- Type: array

### Parameter: `tags`

Tags of the Firewall policy resource.

- Required: No
- Type: object

### Parameter: `threatIntelMode`

The operation mode for Threat Intel.

- Required: No
- Type: string
- Default: `'Deny'`
- Allowed:
  ```Bicep
  [
    'Alert'
    'Deny'
    'Off'
  ]
  ```

### Parameter: `tier`

Tier of Firewall Policy.

- Required: No
- Type: string
- Default: `'Standard'`
- Allowed:
  ```Bicep
  [
    'Basic'
    'Premium'
    'Standard'
  ]
  ```

### Parameter: `workspaces`

List of workspaces for Firewall Policy Insights.

- Required: No
- Type: array

## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `location` | string | The location the resource was deployed into. |
| `name` | string | The name of the deployed firewall policy. |
| `resourceGroupName` | string | The resource group of the deployed firewall policy. |
| `resourceId` | string | The resource ID of the deployed firewall policy. |

## Cross-referenced modules

This section gives you an overview of all local-referenced module files (i.e., other modules that are referenced in this module) and all remote-referenced files (i.e., Bicep modules that are referenced from a Bicep Registry or Template Specs).

| Reference | Type |
| :-- | :-- |
| `br/public:avm/utl/types/avm-common-types:0.5.1` | Remote reference |

## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the [repository](https://aka.ms/avm/telemetry). There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
