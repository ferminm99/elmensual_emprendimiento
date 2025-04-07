Write-Host "🔨 Construyendo imagen Docker..."
docker build -t ghcr.io/ferminm99/elmensual-backend:latest .

Write-Host "🚀 Pusheando imagen a GitHub Container Registry..."
docker push ghcr.io/ferminm99/elmensual-backend:latest

Write-Host "✅ Deploy completo."
