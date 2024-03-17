package beta.groups

import data.beta.db

import future.keywords.if
import future.keywords.in

if_group_exists(group_id) if {
	some group in db.groups
	group == group_id
}
