from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "dd"

if __name__ == "__main__":
    # 监听所有地址，端口 8080
    app.run(host="0.0.0.0", port=8080)
