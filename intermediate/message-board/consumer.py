import time

input_file = "/data/messages.txt"

while True:
    try:
        with open(input_file, "r") as f:
            content = f.read().strip()
            if content:
                print(f"Read messages:\n {content}")
            else:
                print("No new messages.")
    
    except FileNotFoundError:
        print(f"File {input_file} not found. Waiting for messages...")

    time.sleep(5)  # Sleep for 5 seconds before checking again
    