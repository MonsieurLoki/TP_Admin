import uuid
from datetime import datetime
import redis

from flask import Flask, request
from flask_cors import CORS

import woody
import pika

#RabbitMQ Connection (rabbitmq is our rabbitmq stack service -> hostname)



app = Flask('my_api')
cors = CORS(app)

redis_db = redis.Redis(host='redis', port=6379, db=0)

import socket

api_hostname = socket.gethostname()


#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#from utils import get_last_product, launch_server, make_some_heavy_computation

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

@app.get('/api/ping')
def ping():
    print("test ping")
    return f'ping (hostname:{api_hostname})'


# # ### 1. Misc service ### (note: la traduction de miscellaneous est 'divers'
# @app.route('/api/misc/time', methods=['GET'])
# def get_time():
#     return f'misc: {datetime.now()}'


# @app.route('/api/misc/heavy', methods=['GET'])
# def get_heavy():
#     # TODO TP9: cache ?
#     name = request.args.get('name')
#     r = redis_db.get(name)
#     if r == None:
#         r = woody.make_some_heavy_computation(name)

#         # value = f'value:({r}) calculated on {datetime.now().strftime('%H:%M:%S')} on hostname:{api_hostname}'
#         redis_db.set(name, r, 30)
#         redis_db.set('static', r, 30)

#     # on rajoute la date pour pas que le resultat ne soit mis en cache par le browser
#     return f'{datetime.now()}: {r}'


# ### 2. Product Service ###
@app.route('/api/products', methods=['GET'])
def add_product():
    # product = request.json.get('product', '')
    product = request.args.get('product')
    woody.add_product(str(product))
    return str(product) or "none"


@app.route('/api/products/<int:product_id>', methods=['GET'])
def get_product(product_id):
    return "not yet implemented"


@app.route('/api/products/last', methods=['GET'])
def get_last_product():
    # TODO TP9: put in cache ? cache duration ?
    last_product = woody.get_last_product()  # note: it's a very slow db query
    return f'db: {datetime.now().strftime('%H:%M:%S')} - {last_product}'


# ### 3. Order Service
@app.route('/api/orders/do', methods=['GET'])
def create_order():

    # probably not the most efficient to reopen the connection for every message...
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='rabbitmq'))
    channel = connection.channel()
    channel.queue_declare(queue='woody_order_queue')


    # very slow process because some payment validation is slow (maybe make it asynchronous ?)
    # order = request.get_json()
    product = request.args.get('order')
    order_id = str(uuid.uuid4())
    channel.basic_publish(
        exchange='',
        routing_key='woody_order_queue',
        body=f'{product}|{order_id}'
        )

    # TODO TP10: this next line is long, intensive and can be done asynchronously ... maybe use a message broker ?
    # process_order(order_id, product)

    # not clear when the rabbitmq connection should be closed...
    connection.close()

    return f"Your process {order_id} has been created and will be processed soon"


@app.route('/api/check_orders/', methods=['GET'])
def get_order1():
    order_id = request.args.get('order_id')
    status = woody.get_order2(order_id)

    return f'order "{order_id}": {status}'



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

