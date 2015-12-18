# ansible-bind

An Ansible role to configure a multi-machine BIND cluster for multiple domains.

This role will:

- install bind packages
- install more bind packages if you intend to run bind in a chroot
- template named.conf on each node
- validate locally each forward and reverse zone file before copying them on each node
- start and enable the service

## Requirements

Only RHEL or CentOS 6/7

The required filter_plugin to generate a reverse zone for could be embedded in
ansible 2.0. Meanwhile, you will need a copy of the `filter_plugins` directory
inside the `playbook_dir` or wherever you point it inside `ansible.cfg`

## Role Variables

Default variables:

```yaml

```

## Dependencies

None.

## Example Playbook

See the vagrant setup inside the test directory.

Testing
-------

In the `tests` directory there is:

-   A `group_vars` directory to configure the cluster
-   A Vagrantfile that will spin a cluster of 3 VM.
-   A `test.yml` play that targets the bind_cluster groups

**Hostname** | **ip** | group |\
        | :--- | :--- |\
`bind-m1` | 192.168.56.53 | bindmasters |\
`bind-m2` | 192.168.56.54 | bindslaves |\
`bind-m3` | 192.168.56.55 | bindslaves |

Then `bind_cluster` group is a child group of `bindslaves` and `bindslaves`. All three machines will be provisionned in parallel.

Those IP addresses are in the default VirtualBox Host Only network interface (192.168.56.0/24) subnet.

You can query them from your host. Install `vagrant-hostmanager` plugin to populate `/etc/hosts` of your host machine and query them via their hostname.

```bash
$ dig @192.168.56.54 machine1.example.org
```

## Contributing

PR welcome!

## Todo

- make it work with bind chroot
- add bind-chroot package installation
- template named.soa
- A python script to parse all forward zones and generate all the reverse RR from them
