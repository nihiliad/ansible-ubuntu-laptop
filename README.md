# ansible-ubuntu-laptop

Set up an Ubuntu laptop with Ansible.

## Testing with Vagrant

### vagrant provision

The `Vagrantfile` includes code to call `ansible-playbook` with `playbook.yml` when
executing `vagrant provision`.

### ANSIBLE_ARGS

We can pass arguments to `ansible-playbook` with the
`ANSIBLE_ARGS` environment variable. For example:

```bashrc
ANSIBLE_ARGS='--tags=vim' vagrant provision
```

### vagrant snapshot

__Note__: The following `vagrant snapshot` commands require Vagrant >= 1.8. See the
[Vagrant snapshot docs](https://www.vagrantup.com/docs/cli/snapshot.html) for more info.

```bashrc
vagrant up --no-provision
vagrant snapshot push
vagrant provision
```

If necessary, improve Ansible code and iterate:

```bashrc
vagrant snapshot pop --no-provision
vagrant snapshot push
vagrant up --no-provision
vagrant provision
```

Even more control via named snapshots:

```bashrc
vagrant snapshot save snapshot-name
vagrant provision
vagrant snapshot resotre snapshot-name --no-provision
```
