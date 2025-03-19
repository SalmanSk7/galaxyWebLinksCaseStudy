from flask import Flask

app = Flask(__name__)

@app.route("/")
def ReportingService():
    return "<p>Hello user, This page data shows about ReportingService </p>" 

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)