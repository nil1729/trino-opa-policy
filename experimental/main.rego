package experimental

import data.access
import data.admin
import data.context
import data.experimental.groups
import future.keywords.contains
import future.keywords.if
import future.keywords.in

default allow = false

# this section handle the policies for `admin` user
allow if {
	# print(input)
	admin.allow_admin
}

# this section handle the policies for users by group
allow if {
	# print(input)
	some group in context.groups
	experimental.groups.if_group_exists(group)
	# access.allow_resource
}
