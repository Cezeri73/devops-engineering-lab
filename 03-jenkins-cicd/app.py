import os
from flask import Flask
from redis import Redis

app = Flask(__name__)

# os.environ.get ile değerleri dışarıdan okuyoruz. 
# Eğer bulamazsa diye yanlarına 'localhost' gibi yedek (default) değerler koyuyoruz.
db_host = os.environ.get('REDIS_HOST', 'localhost')
db_port = int(os.environ.get('REDIS_PORT', 6379))
app_port = int(os.environ.get('FLASK_PORT', 5000))

# Artık IP veya isim koda gömülü değil!
redis_client = Redis(host=db_host, port=db_port)

@app.route('/')
def hello():
    count = redis_client.incr('hits')
    return {'message': 'Hello from Secure Docker Compose!', 'counter': count}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=app_port)