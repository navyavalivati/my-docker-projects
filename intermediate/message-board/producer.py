import time
from datetime import datetime
import sys

# Force unbuffered output
sys.stdout = open(sys.stdout.fileno(), 'w', 1)

output_file = "/data/messages.txt"

while True:
    message = f"Message at {datetime.now()}\n"
    with open(output_file, "a") as f:
        f.write(message)
    print(f"Wrote: {message.strip()}")
    time.sleep(5)