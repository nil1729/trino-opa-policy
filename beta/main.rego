package beta.policies

import data.admin
import data.beta.access
import data.beta.groups
import data.context
import data.trino
import future.keywords.contains
import future.keywords.if
import future.keywords.in

default allow = false

# this section handle the policies for `admin` user
allow if {
	# print(input)
	admin.allow_admin
}

# this section handle the policies for users by group
allow if {
	# print(input)
	some group in context.groups
	groups.if_group_exists(group)
	access.allow_resource
}

batch contains i if {
	some i
	raw_resource := input.action.filterResources[i]
	allow with input.action.resource as raw_resource
}

batch contains i if {
	some i
	input.action.operation == trino.operations.filter_columns
	count(input.action.filterResources) == 1
	raw_resource := input.action.filterResources[0]
	count(raw_resource.table.columns) > 0
	new_resources := [
	object.union(raw_resource, {"table": {"column": column_name}}) |
		column_name := raw_resource.table.columns[_]
	]
	allow with input.action.resource as new_resources[i]
}
