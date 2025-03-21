# Message Board with Shared Volume
- Container 1(Producer): A python script that writes timestamped messages to a file in a shared volume.
- Container 2(Consumer): A python script that reads and prints messages from the same file in the shared volume.
- Docker with a named volume for data sharing.

# Steps to run

- Build the image:
```bash
docker build -t message-board .
```
- Create a shared volume
```bash
docker volume create message-data
```
- Run the producer container
```bash
docker run -d --name producer -v message-data:/data message-board
```
The producer writes messages to /data/messages.txt in the volume. <br>
- Run the consumer 
```bash
docker run -d --name consumer -v message-data:/data message-board python consumer.py
```
The consumer reads from /data/messages.txt. <br>

- Check the output 
View producer's logs:
```bash
docker logs producer
```
View consumer's logs
```bash
docker logs consumer
```
- Clean Up 
Stop and remove containers when done:
```bash
docker stop producer consumer
docker rm producer consumer
docker volume rm message-data
```