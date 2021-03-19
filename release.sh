set -e
tag=$1
hugo
git add .
git commit -m "release ${tag}"
git tag -a "${tag}" -m "release ${tag}"
docker build -t mcorbin/meuse-website:${tag} .
docker push mcorbin/meuse-website:${tag}
git push --tags
git push
