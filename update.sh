#!/usr/bin/env bash

version=1.19

# Download latest paper jar
name=paper
api=https://papermc.io/api/v2
latest_build="$(curl -sX GET "$api"/projects/"$name"/version_group/"$version"/builds -H 'accept: application/json' | jq '.builds [-1].build')"
temp="$(curl -sX GET "$api"/projects/"$name"/version_group/"$version"/builds -H 'accept: application/json' | jq '.builds [-1].version')"
temp="${temp%\"}"
version="${temp#\"}"
download_url="$api"/projects/"$name"/versions/"$version"/builds/"$latest_build"/downloads/"$name"-"$version"-"$latest_build".jar
wget "$download_url" -O paper.jar

echo "eula=true" > eula.txt

chmod +x *.sh

# TODO Download plugins and datapacks somehow
mkdir -p world/datapacks
mkdir -p world_nether
mkdir -p world_the_end

wget "https://static1.squarespace.com/static/6240c1f3e10b50416d969a84/t/63a7140d4527106aea370915/1671894030145/Terralith_1.19.x_v2.3.5.zip" -O world/datapacks/Terralith.zip
