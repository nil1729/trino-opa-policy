package beta.access

import data.beta.validations
import data.context
import data.trino
import future.keywords.every
import future.keywords.if
import future.keywords.in

default allow_for_resource_column = false

user_groups := context.groups

catalog_name := context.resource.table.catalogName

schema_name := context.resource.table.schemaName

table_name := context.resource.table.tableName

column_names := context.resource.table.columns

column_name := context.resource.table.column

operation := context.operation

allow_for_resource_column if {
	operation == trino.operations.filter_columns
	some group in user_groups
	validations.group_can_access_column(group, catalog_name, schema_name, table_name, column_name)
}

allow_for_resource_column if {
	operation == trino.operations.filter_columns
	check_every_column_access
}

allow_for_resource_column if {
	operation == trino.operations.select_from_columns
	check_every_column_access
}

check_every_column_access if {
	every column in column_names {
		some group in user_groups
		validations.group_can_access_column(group, catalog_name, schema_name, table_name, column)
	}
}
