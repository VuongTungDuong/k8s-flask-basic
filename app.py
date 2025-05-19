from secrets import randbelow
from time import sleep

from flask import Flask

app = Flask(__name__)

index_key = randbelow(5)


@app.route("/")
def hello_world():
    sleep(2)
    return f"Hello, Kubernetes with Flask!, {index_key}"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
