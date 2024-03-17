package beta.access

import data.beta.validations
import data.context
import data.trino
import future.keywords.if
import future.keywords.in

default allow_for_resource_schema = false

user_groups := context.groups

catalog_name := context.resource.schema.catalogName

schema_name := context.resource.schema.schemaName

operation := context.operation

allow_for_resource_schema if {
	operation == trino.operations.show_tables
	some group in user_groups
	validations.group_can_access_schema(group, catalog_name, schema_name)
}

allow_for_resource_schema if {
	operation == trino.operations.filter_schemas
	some group in user_groups
	validations.group_can_access_schema(group, catalog_name, schema_name)
}
