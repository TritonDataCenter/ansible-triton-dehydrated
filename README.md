triton-dehydrated
=================

An ansible playbook to install and configure [triton-dehydrated][td] to generate
[Let's Encrypt][le] certificates.

[td]: https://github.com/joyent/triton-dehydrated
[le]: https://www.letsencrypt.org/

Requirements
------------

This playbook will only work on virtual instances created in [Triton][t]. The
Triton Datacenter must have [CNS][cns] configured and be globally resolvable.

The [triton-ansible-inventory][tai] module may also be helpful, but is not
required.

[t]: https://github.com/joyent/triton
[cns]: https://github.com/joyent/triton-cns
[tai]: https://github.com/joyent/triton-ansible-inventory

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MPL-2

Author Information
------------------

Copyright 2021 Joyent, Inc.
