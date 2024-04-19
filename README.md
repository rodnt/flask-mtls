# flask-mtls
Poc of how to create MTLS with python and Flask

#### Install

```
$ git clone https://github.com/rodnt/flask-mtls.git
$ cd flask-mtls; pipenv shell
$ pipenv install -r Pipfile
$ ./gen-keys.sh
```

#### Start the server

```bash
python3 main.py
```

#### Testing with curl

```bash
curl https://localhost:5000/ --cert client.crt --key client.key --cacert ca.crt -v
```


