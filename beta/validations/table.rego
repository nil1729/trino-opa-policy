package beta.validations

import data.beta.groups
import future.keywords.if
import future.keywords.in

group_can_access_table(group_id, catalog_name, schema_name, table_name) if {
	table_access := groups.group_table_access(group_id)
	some obj in table_access
	obj.catalog == catalog_name
	obj.schema == schema_name
	table_name in obj.table
}
