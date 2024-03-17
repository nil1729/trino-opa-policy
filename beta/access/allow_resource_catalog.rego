package beta.access

import data.beta.validations
import data.context
import data.trino
import future.keywords.if
import future.keywords.in

default allow_for_resource_catalog = false

user_groups := context.groups

catalog_name := context.resource.catalog.name

operation := context.operation

allow_for_resource_catalog if {
	operation == trino.operations.filter_catalogs
	some group in user_groups
	validations.group_can_access_catalog(group, catalog_name)
}

allow_for_resource_catalog if {
	operation == trino.operations.show_schemas
	some group in user_groups
	validations.group_can_access_catalog(group, catalog_name)
}

allow_for_resource_catalog if {
	operation == trino.operations.access_catalogs
	some group in user_groups
	validations.group_can_access_catalog(group, catalog_name)
}
