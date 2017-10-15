#!flask/bin/python
from flask import Flask
from subprocess import call

app = Flask(__name__)

@app.route('/off')
def tv_off():
    ret = call('echo "standby 0" | cec-client -s -d 1', shell=True)
    return "OK " + str(ret)

@app.route('/on')
def tv_on():
    ret = call('echo "on 0" | cec-client -s -d 1', shell=True)
    return "OK " + str(ret)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=50002)
