#!/bin/bash
echo "[1] Simulation attaque par force brute SSH..."
for i in {1..12}; do
  docker exec ubuntu-agent sshpass -p "WrongPassword$i" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=2 root@localhost 2>/dev/null || true
done

echo "[2] Simulation élévation de privilèges (sudo)..."
docker exec -u devops ubuntu-agent bash -c 'echo "WrongSudoPass" | sudo -S cat /etc/shadow 2>/dev/null || true'
docker exec -u devops ubuntu-agent bash -c 'echo "DevOps2026!" | sudo -S id'
docker exec -u devops ubuntu-agent bash -c 'echo "DevOps2026!" | sudo -S cat /etc/sudoers > /dev/null'
echo "[+] Simulations terminées."
