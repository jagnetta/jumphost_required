# jumphost_required
Bash script to check if a jumphost is needed.  Based on a ruby script to do the same produced by devops.

Link to the original script, and general usage:
https://wiki.fuze.global/display/INF/How+To+Use+A+Jumphost+in+your+SSH+Client+Configurations

This provides a script and an SSH config file to use for your host to use a jumphost or not.

Step 1:  Rename the file ssh_config to $HOME/.ssh/config

Step 2:  Edit $HOME/.ssh/config and enter the values requested from the comments (e.g., username, jumphost, and the path to the jumphost_required script)

Step 3:  Move the jumphost_required script to a location in your path, or specify the full path in the $HOME/.ssh/config script
