set -e
tag=$1
hugo
git tag -a "${tag}" -m "release ${tag}"
docker build -t mcorbin/meuse-website:${tag} .
docker push mcorbin/meuse-website:${tag}
git push --tags
