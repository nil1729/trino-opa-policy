package beta.validations

import data.beta.groups
import future.keywords.if
import future.keywords.in

group_can_access_column(group_id, catalog_name, schema_name, table_name, column_name) if {
	column_access := groups.group_column_access(group_id)
	some obj in column_access
	obj.catalog == catalog_name
	obj.schema == schema_name
	obj.table == table_name
	column_name in obj.column
}
