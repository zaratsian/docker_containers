# Create an admin user (you will be prompted to set username, first and last name before setting a password)
fabmanager create-admin --app superset

echo "Sleeping for 15 seconds..."
sleep 15

# Initialize the database
superset db upgrade

# Load some data to play with
superset load_examples

# Create default roles and permissions
superset init

# Start the web server on port 8088, use -p to bind to another port
# superset runserver

# To start a development web server, use the -d switch
# superset runserver -d
