# Terraform with Ansible

1. Apply terraform resources
    - ```terraform apply```
2. Test ansible by pinging resources
    - ```ansible {group_name} -m ping -i inventory.ini```
3. Run ansible playbook
    - ```ansible-playbook -i inventory.ini playbook.yaml```