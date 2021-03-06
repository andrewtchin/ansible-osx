# ansible-osx

## Install
```
ansible-playbook -vvv playbooks/osx-preinstall.yml --ask-sudo-pass --extra-vars=@vars/osx.yml
ansible-playbook -vvv playbooks/osx.yml --ask-sudo-pass --extra-vars=@vars/osx.yml
```

Configure preferences through defaults script:
```
ansible-playbook -vvv playbooks/osx-defaults.yml --ask-sudo-pass --extra-vars=@vars/osx.yml
```

Install additional apps:
```
ansible-playbook -vvv playbooks/osx-apps.yml --ask-sudo-pass --extra-vars=@vars/osx.yml
```

Remove unnecessary apps:

Disable SIP
```
csrutil disable
```

Restart and run playbook
```
ansible-playbook -vvv playbooks/osx-uninstall-applications.yml --ask-sudo-pass
```

Restart and enable SIP
```
csrutil enable
```

## OSX Hardening (WIP)
```
ansible-playbook -vvv playbooks/osx-hardening.yml --ask-sudo-pass
```
