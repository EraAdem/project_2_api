curl "http://localhost:4741/flights" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
