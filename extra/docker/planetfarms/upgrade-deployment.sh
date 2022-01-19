updated_at=$(date +%s)
kubectl patch deployment planetfarms-art -n planetfarms -p "{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"exentriq.com/updated-at\":\"$updated_at\"}}}}}"