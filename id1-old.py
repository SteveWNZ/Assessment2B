# DSYS601 - Assesment 2 - Steve West
# Version 1.0
# Script update api id1 for test 
#
import requests
import json

# Vairables and Options
New_Value = float("1.0")

# Create the API URL to use
api_url = "http://172.17.0.3:5050/api/v1.0/equipment/1"
    
# Get Device Data
device_data = requests.get(api_url)
print (device_data)
print()
    
# Load the reccord into Dictonary
J_data = json.loads(device_data.text)
print (J_data)
print()

# Change Type Value for ID1
J_data["Firmware"] = New_Value
print(J_data)
print ()

# Update the Reccord
response = requests.patch(api_url, json=J_data)
print (response)
print ()
