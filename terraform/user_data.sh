#!/bin/bash
# Update system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y git curl build-essential

# Install Nginx
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Install NVM & Node 18
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 18
nvm alias default 18
nvm use 18

# Clone your repo (replace with your actual repo URL)
cd ~
git clone https://github.com/Suchiudhaya/TerraformApp.git
cd TerraformApp/frontend

# Clean old node_modules & install dependencies
rm -rf node_modules package-lock.json
npm install
npm install react-scripts@latest --save

# Build React app
npm run build

# Configure Nginx to serve React build
sudo rm -f /etc/nginx/sites-enabled/default
sudo tee /etc/nginx/sites-available/react-app <<EOF
server {
    listen 80;
    server_name _;

    root /home/ubuntu/TerraformApp/frontend/build;
    index index.html;

    location / {
        try_files \$uri /index.html;
    }

    # Proxy API requests to backend (optional, adjust backend URL)
    location /api/ {
        proxy_pass http://127.0.0.1:5000/;  # Replace with your backend URL if needed
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Enable site & restart Nginx
sudo ln -s /etc/nginx/sites-available/react-app /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx

echo "✅ Deployment complete. React app served on port 80 via Nginx."
