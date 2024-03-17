package beta.access

import data.context
import future.keywords.if

allow_for_resource if {
	allow_for_resource_catalog
}

allow_for_resource if {
	allow_for_resource_schema
}

allow_for_resource if {
	allow_for_resource_table
}

allow_for_resource if {
	allow_for_resource_column
}
