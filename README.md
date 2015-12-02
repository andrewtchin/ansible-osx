# ansible-osx

## Install
```
ansible-playbook -vvv playbooks/osx-preinstall.yml --ask-sudo-pass --extra-vars=@vars/osx.yml
ansible-playbook -vvv playbooks/osx.yml --ask-sudo-pass --extra-vars=@vars/osx.yml
```

Configure preferences through defaults script:
```
ansible-playbook -vvv playbooks/osx-defaults --ask-sudo-pass --extra-vars=@vars/osx.yml
```

Install additional apps:
```
ansible-playbook -vvv playbooks/osx-apps --ask-sudo-pass --extra-vars=@vars/osx.yml
```

## OSX Hardening (WIP)
* ansible-playbook -vvv playbooks/osx-hardening.yml --ask-sudo-pass
