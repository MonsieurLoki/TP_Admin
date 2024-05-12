import pika, sys, os
import woody



# #### 4. internal Services
def process_order(order_id, order):
    # ...
    # ... do many check and stuff
    
    status = woody.make_heavy_validation(order)

    woody.save_order(order_id, status, order)


def main():

    connection = pika.BlockingConnection(pika.ConnectionParameters(host='rabbitmq'))
    channel = connection.channel()

    channel.queue_declare(queue='woody_order_queue')


    def callback(ch, method, properties, body):
            print("\nReceived: ")
            print(body)
            decoded_string = body.decode('utf-8')
            values = decoded_string.split("|")
            product = values[0]
            order_id = values[1]
            print(f'product:{product} and order:{order_id}')
            process_order(order_id, product)

    channel.basic_consume(queue='woody_order_queue', on_message_callback=callback, auto_ack=True)

    channel.start_consuming()


if __name__ == '__main__':
    main()

