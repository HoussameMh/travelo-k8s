$ErrorActionPreference = "Stop"
$repo = $env:IMAGE.Substring(0, $env:IMAGE.LastIndexOf(":"))
Write-Host "1/3 docker build -t $env:IMAGE"
docker build -t $env:IMAGE -f dockerfile .
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
$id = (docker image inspect $env:IMAGE --format "{{.Id}}").Replace("sha256:", "")
Write-Host "2/3 docker tag ${repo}:$id"
docker tag $env:IMAGE "${repo}:$id"
Write-Host "3/3 minikube image load (copie dans le runtime containerd du noeud)"
minikube image load $env:IMAGE "${repo}:$id"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
