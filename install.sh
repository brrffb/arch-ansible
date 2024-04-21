sudo pacman -S ansible-core ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory main.yml -K
