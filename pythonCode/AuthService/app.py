from flask import Flask

app = Flask(__name__)

@app.route("/")
def AuthService():
    return "<p>Hello user, This page data shows about AuthService </p>" 

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)