#!/bin/bash
# Create virtnet custom topology

echo 'You are about to clone the "base" VM to node(s). Make sure you'
echo 'have deleted any existing nodes before continuing. In the '
echo 'VirtualBox GUI, if you have node1, node2, ... then right-click'
echo 'on them and select "Remove..." and then "Delete all files". '
echo 'They need to be deleted before continuing.'

read -n1 -r -p "Press any key to continue..." key

# Shortcut to the Virutal Box manager executable
vbm="VBoxManage"

# Clone and configure each node

# Node 1 
${vbm} clonevm base --name node1 --snapshot base --options link --register
${vbm} modifyvm node1 --cableconnected2 off
${vbm} modifyvm node1 --cableconnected3 off
${vbm} modifyvm node1 --nic2 intnet --intnet2 neta
${vbm} modifyvm node1 --cableconnected2 on
${vbm} modifyvm node1 --natpf1 delete ssh
${vbm} modifyvm node1 --natpf1 ssh,tcp,,2201,,22

# Node 2 
${vbm} clonevm base --name node2 --snapshot base --options link --register
${vbm} modifyvm node2 --cableconnected2 off
${vbm} modifyvm node2 --cableconnected3 off
${vbm} modifyvm node2 --nic2 intnet --intnet2 neta
${vbm} modifyvm node2 --cableconnected2 on
${vbm} modifyvm node2 --natpf1 delete ssh
${vbm} modifyvm node2 --natpf1 ssh,tcp,,2202,,22

# Node 3 
${vbm} clonevm base --name node3 --snapshot base --options link --register
${vbm} modifyvm node3 --cableconnected2 off
${vbm} modifyvm node3 --cableconnected3 off
${vbm} modifyvm node3 --nic2 intnet --intnet2 neta
${vbm} modifyvm node3 --cableconnected2 on
${vbm} modifyvm node3 --natpf1 delete ssh
${vbm} modifyvm node3 --natpf1 ssh,tcp,,2203,,22

# Node 4 
${vbm} clonevm base --name node4 --snapshot base --options link --register
${vbm} modifyvm node4 --cableconnected2 off
${vbm} modifyvm node4 --cableconnected3 off
${vbm} modifyvm node4 --nic2 intnet --intnet2 neta
${vbm} modifyvm node4 --cableconnected2 on
${vbm} modifyvm node4 --natpf1 delete ssh
${vbm} modifyvm node4 --natpf1 ssh,tcp,,2204,,22

# Node5
${vbm} clonevm base --name node5 --snapshot base --options link --register
${vbm} modifyvm node5 --cableconnected2 off
${vbm} modifyvm node5 --cableconnected3 off
${vbm} modifyvm node5 --nic2 intnet --intnet2 neta
${vbm} modifyvm node5 --cableconnected2 on
${vbm} modifyvm node5 --natpf1 delete ssh
${vbm} modifyvm node5 --natpf1 ssh,tcp,,2205,,22

# Node6
${vbm} clonevm base --name node6 --snapshot base --options link --register
${vbm} modifyvm node6 --cableconnected2 off
${vbm} modifyvm node6 --cableconnected3 off
${vbm} modifyvm node6 --nic2 intnet --intnet2 neta
${vbm} modifyvm node6 --cableconnected2 on
${vbm} modifyvm node6 --natpf1 delete ssh
${vbm} modifyvm node6 --natpf1 ssh,tcp,,2206,,22

#Node 7
#${vbm} clonevm base --name node7 --snapshot base --options link --register
#${vbm} modifyvm node7 --cableconnected2 off
#${vbm} modifyvm node7 --cableconnected3 off
#${vbm} modifyvm node7 --nic2 intnet --intnet2 neta
#${vbm} modifyvm node7 --cableconnected2 on
#${vbm} modifyvm node7 --natpf1 delete ssh
#${vbm} modifyvm node1 --natpf1 ssh,tcp,,2207,,22

read -n1 -r -p "Press any key to continue..." key

echo 'You should now have the following new VMs in VirtualBox:'
echo '   node1 node2 node3 node4 node5 node6'
echo 'If not, then make sure you delete any OLD node VMs before '
echo 'running this command again. '
echo 'You should now do the following for each node created:'
echo '   1. Start "node1" in VirtualBox'
echo '   2. Login with username "network" and password "network"'
echo '   3. Run the command:'
echo '      sudo bash virtnet/bin/vn-deploynode 101 1'
echo '   4. Repeat steps 1, 2 and 3 for node2, but with command:'
echo '      sudo bash virtnet/bin/vn-deploynode 101 2'
echo '   5. Repeat steps 1, 2 and 3 for node3, but with command:'
echo '      sudo bash virtnet/bin/vn-deploynode 101 3'
echo '   6. Repeat steps 1, 2 and 3 for node4, but with command:'
echo '      sudo bash virtnet/bin/vn-deploynode 101 4'
echo '   7. Repeat steps 1, 2 and 3 for node5, but with command:'
echo '      sudo bash virtnet/bin/vn-deploynode 101 5'
echo '   8. Repeat steps 1, 2 and 3 for node6, but with command:'
echo '      sudo bash virtnet/bin/vn-deploynode 101 6'
#echo '   9. Repeat steps 1, 2 and 3 for node7, but with command:'
#echo '      sudo bash virtnet/bin/vn-deploynode 100 7'
echo 'Perform the above steps now. Once completed, press any key to quit.'

read -n1 -r -p "Press any key to continue..." key
