package beta.access

import data.beta.validations
import data.context
import data.trino
import future.keywords.if
import future.keywords.in

default allow_for_resource_table = false

user_groups := context.groups

catalog_name := context.resource.table.catalogName

schema_name := context.resource.table.schemaName

table_name := context.resource.table.tableName

operation := context.operation

allow_for_resource_table if {
	operation == trino.operations.show_columns
	some group in user_groups
	validations.group_can_access_table(group, catalog_name, schema_name, table_name)
}

allow_for_resource_table if {
	operation == trino.operations.filter_tables
	some group in user_groups
	validations.group_can_access_table(group, catalog_name, schema_name, table_name)
}
