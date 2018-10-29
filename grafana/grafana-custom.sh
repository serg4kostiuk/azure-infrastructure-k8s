#sudo docker build -t grafana:custom -f custom-plugins . &
#wait $!

sudo docker run \
  -d \
  -p 3000:3000 \
  --name=grafana \
  -e "GF_SECURITY_ADMIN_PASSWORD=123qwe" \
  -e "GF_SERVER_PROTOCOL=http" \
  -e "GF_SERVER_DOMAIN=demo03-grafana" \
  -e "GF_SERVER_HTTP_PORT=3000" \
  -e "GF_SERVER_ROOT_URL=%(protocol)s://%(domain)s:%(http_port)s/" \
  -e "GF_AUTH.GENERIC_OAUTH_enabled=true" \
  -e "GF_AUTH.GENERIC_OAUTH_name=Azure AD" \
  -e "GF_AUTH.GENERIC_OAUTH_ALLOW_SIGN_UP=true" \
  -e "GF_AUTH.GENERIC_OAUTH_client_id = https://casablancaukrainegmail.onmicrosoft.com/6bea3a89-cb6f-42ee-8dbd-4632b8810416" \
  -e "GF_AUTH.GENERIC_OAUTH_client_secret = iJkxDgnLippXHVnkNy3AZhRAzSWFeu0v8obU6iDCoWA=" \
  -e "GF_AUTH.GENERIC_OAUTH_scopes = openid email name" \
  -e "GF_AUTH.GENERIC_OAUTH_auth_url = https://login.microsoftonline.com/e241b4a0-b3ae-4690-8721-5601a0c8314b/oauth2/authorize" \
  -e "GF_AUTH.GENERIC_OAUTH_token_url = https://login.microsoftonline.com/e241b4a0-b3ae-4690-8721-5601a0c8314b/oauth2/token" \
  -v grafana-storage:/var/lib/grafana \
  grafana:custom

sudo docker ps