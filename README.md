AWX Custom Execution Environment for Netbox

# Overview

This pulls in the needed requirements in order to access netbox from within ansible.

# To use

Add a new "Execution Environment" to awx.  Name it "awx-netbox-ee" and set the
image to "ghcr.io/rfdrake/awx-netbox-ee", then set Pull to "Always pull" or
"Only pull the image if not present"

# Customizing and building your own image

edit build_and_publish.sh to change the location of your docker registry and the credentials you use.

If you are using ansible-builder directly installed from pip then you will want to do something like the following:

```
    python3 -m venv ansible-builder
    cd ansible-builder
    source bin/activate
    pip install ansible-builder
```

Then run build_and_publish.sh.

Alternatively, you can use the docker version, but it may leave an image on your machine that you don't need.
