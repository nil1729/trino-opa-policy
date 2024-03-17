package beta.groups

import data.beta.db

import future.keywords.if
import future.keywords.in

if_group_exists(group_id) if {
	some group in db.groups
	group == group_id
}

group_catalog_access(group_id) := value if {
	desired_obj := db.catalog[_]
	desired_obj.group == group_id
	value := desired_obj.access
}

group_schema_access(group_id) := value if {
	desired_obj := db.schema[_]
	desired_obj.group == group_id
	value := desired_obj.access
}

group_table_access(group_id) := value if {
	desired_obj := db.table[_]
	desired_obj.group == group_id
	value := desired_obj.access
}

group_column_access(group_id) := value if {
	desired_obj := db.column[_]
	desired_obj.group == group_id
	value := desired_obj.access
}
