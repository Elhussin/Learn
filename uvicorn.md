
# creat ssl in git terminal
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes

# downlod
https://www.uvicorn.org/
# use uvicorn
uvicorn optics_tenant.asgi:application --host 0.0.0.0 --port 8000 --ssl-keyfile=key.pem --ssl-certfile=cert.pem
