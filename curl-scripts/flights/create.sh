curl "http://localhost:4741/flights" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "flight": {
      "place": "'"${PLACE}"'",
      "date": "'"${DATE}"'",
      "description": "'"${DESCRIPTION}"'",
      "user_id": "'"${ID}"'"
    }
  }'

echo
