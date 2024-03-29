package validations

import data.users
import future.keywords.if
import future.keywords.in

user_can_access_catalog(user_id, catalog_name) if {
	catalog_access := users.user_catalog_access(user_id)
	some obj in catalog_access
	catalog_name in obj.catalog
}
