# Planetfarms Art customization

Legacy image (nodejs 10):
kbm001exe.exentriq.com:5000/exentriq/planetfarms-art:node10

# Commands

docker build --no-cache -t kb-registry.exentriq.cloud:5001/exentriq/planetfarms-art .
docker tag kb-registry.exentriq.cloud:5001/exentriq/planetfarms-art kb-registry.exentriq.cloud:5001/exentriq/planetfarms-art:2.0.11
docker push kb-registry.exentriq.cloud:5001/exentriq/planetfarms-art
docker push kb-registry.exentriq.cloud:5001/exentriq/planetfarms-art:2.0.11
