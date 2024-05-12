import redis

# Connect to Redis
r = redis.Redis(host='localhost', port=6379, db=0)

# Set the value 10 to the key 'toto'
r.set('toto', 10)

# Print confirmation
print("Value set successfully.")
