# Dockerfile
FROM node:18-alpine

# buat direktori kerja
WORKDIR /app

# salin package manifest dulu (memanfaatkan cache layer Docker)
COPY package*.json ./

# install dependencies (npm ci lebih deterministik di CI)
RUN npm ci --only=production

# salin sisa source
COPY . .

# expose port aplikasi
EXPOSE 3000

# perintah default untuk menjalankan aplikasi
CMD ["node", "index.js"]
