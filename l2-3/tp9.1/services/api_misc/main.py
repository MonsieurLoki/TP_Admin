import uuid
from datetime import datetime
import redis

from flask import Flask, request
from flask_cors import CORS

import woody

app = Flask('my_api')
cors = CORS(app)

redis_db = redis.Redis(host='redis', port=6379, db=0)

import socket

api_hostname = socket.gethostname()


#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#from utils import get_last_product, launch_server, make_some_heavy_computation

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


# Function to log incoming requests
@app.before_request
def log_request():
    print(f"Incoming request: {request.method} {request.path}")

# Function to log outgoing responses
@app.after_request
def log_response(response):
    print(f"Outgoing response: {response.status_code}")
    return response

# Example route
@app.route('/')
def index():
    return "Hello, World!"

@app.get('/api/ping')
def ping():
    return f'ping (hostname:{api_hostname})'


# ### 1. Misc service ### (note: la traduction de miscellaneous est 'divers'
@app.route('/api/misc/time', methods=['GET'])
def get_time():
    return f'misc: {datetime.now()}'


@app.route('/api/misc/heavy', methods=['GET'])
def get_heavy():
    # TODO TP9: cache ?
    name = request.args.get('name')
    r = redis_db.get(name)
    if r == None:
        r = woody.make_some_heavy_computation(name)

        # value = f'value:({r}) calculated on {datetime.now().strftime('%H:%M:%S')} on hostname:{api_hostname}'
        redis_db.set(name, r, 30)
        redis_db.set('static', r, 30)

    # on rajoute la date pour pas que le resultat ne soit mis en cache par le browser
    return f'{datetime.now()}: {r}'


# # ### 2. Product Service ###
# @app.route('/api/products', methods=['GET'])
# def add_product():
#     # product = request.json.get('product', '')
#     product = request.args.get('product')
#     woody.add_product(str(product))
#     return str(product) or "none"


# @app.route('/api/products/<int:product_id>', methods=['GET'])
# def get_product(product_id):
#     return "not yet implemented"


# @app.route('/api/products/last', methods=['GET'])
# def get_last_product():
#     # TODO TP9: put in cache ? cache duration ?
#     last_product = woody.get_last_product()  # note: it's a very slow db query
#     return f'db: {datetime.now()} - {last_product}'


# # ### 3. Order Service
# @app.route('/api/orders/do', methods=['GET'])
# def create_order():
#     # very slow process because some payment validation is slow (maybe make it asynchronous ?)
#     # order = request.get_json()
#     product = request.args.get('product')
#     order_id = str(uuid.uuid4())

#     # TODO TP10: this next line is long, intensive and can be done asynchronously ... maybe use a message broker ?
#     process_order(order_id, product)

#     return f"Your process {order_id} has been created"


# @app.route('/api/orders/', methods=['GET'])
# def get_order():
#     order_id = request.args.get('order_id')
#     status = woody.get_order(order_id)

#     return f'order "{order_id}": {status}'


# # #### 4. internal Services
# def process_order(order_id, order):
#     # ...
#     # ... do many check and stuff
#     status = woody.make_heavy_validation(order)

#     woody.save_order(order_id, status, order)


#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# @app.get('/api/slow_static')
# def slow_static():

#     value = redis_db.get('woodyValue')
#     if value == None:
#         r = make_some_heavy_computation()
#         value = f'value:({r}) calculated on {datetime.now().strftime('%H:%M:%S')} on hostname:{api_hostname}'
#         # redis_db.set('woodyValue', 30, value)
#         redis_db.set('woodyValue', value, 30)
    
#     return f'{datetime.now().strftime('%H:%M:%S')}: >>>>>>>>{value}<<<<<<<<< (api server:{api_hostname})'


# @app.get('/api/slow_dynamic')
# def slow_dynamic():
#     r = make_some_heavy_computation()
#     return f'{datetime.now().strftime('%H:%M:%S')}: {r} (hostname:{api_hostname})'


# @app.get('/api/fast')
# def fast():
#     return f'fast: {datetime.now().strftime('%H:%M:%S')} (hostname:{api_hostname})'


# @app.post('/api/database')
# def products():
#     return f'db: {datetime.now().strftime('%H:%M:%S')} - {get_last_product()}'


#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if __name__ == "__main__":
    woody.launch_server(app, host='0.0.0.0', port=5000)
