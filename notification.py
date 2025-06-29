import os
import requests
from datetime import datetime
import json

def send_notification():
    # Get environment variables
    image_version = os.getenv("IMAGE_VERSION", "latest")
    custom_variable = os.getenv("CUSTOM_VARIABLE", "devops-challenge")
    
    # Generate timestamp in ISO 8601 format
    timestamp = datetime.utcnow().isoformat()
    
    # Prepare payload
    payload = {
        "timestamp": timestamp,
        "deployment": image_version,
        "custom_variable": custom_variable
    }
    
    # Send POST request
    try:
        response = requests.post(
            "https://varengold.io/notification",
            json=payload,
            timeout=10
        )
        response.raise_for_status()
        print(f"Notification sent successfully: {response.status_code}")
        print(f"Payload: {json.dumps(payload, indent=2)}")
    except requests.RequestException as e:
        print(f"Failed to send notification: {e}")
        exit(1)

if __name__ == "__main__":
    send_notification()
