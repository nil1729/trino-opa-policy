package beta.validations

import data.beta.groups
import future.keywords.if
import future.keywords.in

group_can_access_catalog(group_id, catalog_name) if {
	catalog_access := groups.group_catalog_access(group_id)
	some obj in catalog_access
	catalog_name in obj.catalog
}
