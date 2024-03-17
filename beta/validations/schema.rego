package beta.validations

import data.beta.groups
import future.keywords.if
import future.keywords.in

group_can_access_schema(group_id, catalog_name, schema_name) if {
	schema_access := groups.group_schema_access(group_id)
	some obj in schema_access
	obj.catalog == catalog_name
	schema_name in obj.schema
}
