# Locust Docker image

Locust is an easy-to-use, distributed, user load testing tool. It is intended for load-testing web sites (or other systems) and figuring out how many concurrent users a system can handle.

Upstream project website: https://locust.io/

# Usage

### Single instance example:

```
docker run --rm -p 8089:8089 -v $(pwd)/locustfile.py:/locustfile.py siwyd/locust --host https://example.com
```

### Distributed example:

Master:
```
docker run --rm -p 5557-5558:5557-5558 -v $(pwd)/locustfile.py:/locustfile.py siwyd/locust --host https://www.example.com --no-web -c 1000 -r 100 --master --expect-slaves 2
```

Slaves:
```
docker run --rm -v $(pwd)/locustfile.py:/locustfile.py siwyd/locust --slave --master-host=master
```

### Customize

You can tweak all the command line parameters accordingly based on your Locust use case. Check the Locust docs for more info: https://docs.locust.io/.

ENTRYPOINT instead of CMD is used for the locust executable to allow for easily passingof command line parameters without having to specify the executable every time.
