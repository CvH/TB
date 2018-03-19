#!/bin/sh

################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

/etc/init.d/ssh restart
/etc/init.d/network restart
/etc/init.d/ntp restart
