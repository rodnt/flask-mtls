import ssl
from flask import Flask

__author__ = 'rodnt'

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello, mTLS world!"

if __name__ == '__main__':
    # Create an SSL context
    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)  # Use ssl.PROTOCOL_TLS_SERVER for Python 3.6+
    context.load_cert_chain('server.crt', 'server.key')  # Load server cert and key
    context.load_verify_locations('ca.crt')  # CA certificate to verify client certificates
    context.verify_mode = ssl.CERT_REQUIRED  # Require a client certificate

    # Run the Flask app with this SSL context
    app.run(ssl_context=context, host='0.0.0.0', port=8000)

