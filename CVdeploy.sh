#!/bin/bash


sudo systemctl stop nginx
echo "NGINX Detenido"
pkill ngrok
echo "NGROK Detenido"
sudo git pull origin main
echo "Repositorio actualizado"  
sudo systemctl start nginx
echo "NGINX reiniciado"
ngrok http 80 > /dev/null &
sleep 2
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
echo "URL obtenida"
echo "Tu aplicación está disponible en: $NGROK_URL"
