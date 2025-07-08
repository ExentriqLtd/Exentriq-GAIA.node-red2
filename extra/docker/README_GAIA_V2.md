# Tags

- stable: creation date 23/04/2024 before implement and add to package.json new csv node


# Commands

docker build --no-cache -t kb-registry.exentriq.cloud:5001/exentriq/node-red-gaia-v2 latest/
docker tag kb-registry.exentriq.cloud:5001/exentriq/node-red-gaia-v2 kb-registry.exentriq.cloud:5001/exentriq/node-red-gaia-v2:2.0.11
docker push kb-registry.exentriq.cloud:5001/exentriq/node-red-gaia-v2
docker push kb-registry.exentriq.cloud:5001/exentriq/node-red-gaia-v2:2.0.11
