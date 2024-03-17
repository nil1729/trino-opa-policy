package experimental.groups

import data.experimental.db

import future.keywords.if
import future.keywords.in

if_group_exists(group_id) if {
	some group in experimental.db.groups
	group == group_id
}
