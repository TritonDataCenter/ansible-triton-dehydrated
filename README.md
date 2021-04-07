# triton-dehydrated

An ansible playbook to install and configure [triton-dehydrated][td] to generate
[Let's Encrypt][le] certificates.

[td]: https://github.com/joyent/triton-dehydrated
[le]: https://www.letsencrypt.org/

## Requirements

This playbook will only work on virtual instances created in [Triton][t]. Any
image provided by Joyent should reasonably be expected to work.

The Triton Datacenter must have [CNS][cns] configured and be globally
resolvable.

The [triton-ansible-inventory][tai] module may also be helpful, but is not
required.

[t]: https://github.com/joyent/triton
[cns]: https://github.com/joyent/triton-cns
[tai]: https://github.com/joyent/triton-ansible-inventory

## Role Variables

This role requires a `letsencrypt` object that supports the following
properties. Any properties may be ommitted and a suitable default will be used.
At least one of `domains`, `suffix_domains`, `ecesa_domains`,
`ecdsa_suffix_domains` must be provided for certificates to be issued. If not,
dehydrated will still be installed and configured to run but it will exit
immediately.

* `ca`: Must be `$prod_ca` or `$staging_ca`, or a valid Let's Encrypt CA URL. Defaults to `$staging_ca`. Leave this set to `$staging_ca` as you develop so that you don't hit the rate limit cap. Change to `$prod_ca` when you're ready to deploy to production.
* `certdir`: Directory where cettificates will be output. Defaults to `/opt/ssl`.
* `contact`: Email address of the Let's Encrypt account.
* `domains`: Array of RSA certificates to issue. Each element will be an issued certificate. Additional SAN names are space separated.
* `ecdsa_domains`: Array of ECDSA certificates to issue. Otherwise the same as `domains`.
* `ecdsa_suffix_domains`: Array of domain *suffixes* for ECDSA cetrificates. I.e., the hostname will be prepended to each name and a certificate generated.
* `owner`: UNIX file ownership. Defaults to `root:root`. This gets passed to `chown`
* `restart_services`: Array of services that will be restarted.
* `suffix_domains`: Array of domain *suffixes* for RSA cetrificates. I.e., the hostname will be prepended to each name and a certificate generated.
* `well_known`: Let's Encrypt `WELLKNOWN` directory. Defaults to `/var/www/dehydrated`.

Additionally, there are top level `triton_dehydrated_version` and
`triton_dehydrated_download_url` variables that can be overriden if necessary.

## Dependencies

This playbook should work on any image published by Joyent and running on
Triton with CNS names configured to be globally resolvable.

## Example Playbook

    - hosts: servers
      roles:
        - role: joyent.triton-dehydrated
      vars:
        letsencrypt:
          ca: "$prod_ca"
          contact: "ssl_admin@example.com"
          domains:
            - www.example.com api.backend.example.com
          restart_services:
            - nginx

## License

MPL-2.0. See LICENSE.txt in this repository.

## Author Information

Copyright 2021 Joyent, Inc.
