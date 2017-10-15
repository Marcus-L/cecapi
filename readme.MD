# Simple CEC API

The simplest Raspberry Pi CEC Python API (just HDMI on/off), but I'm still documenting this since I forget things super easily.

## Prerequisites

* Raspberry Pi (Jessie+)
* A TV hooked up to the HDMI port
* Python 2.7

    ```bash
    sudo apt-get install python2.7
    ```

* VirtualEnv

    ```bash
    sudo apt-get install virtualenv
    ```

* CEC Utils
    ```bash
    sudo apt-get install cec-utils
    ```

## Installing

1. Clone the repo to the `/home/pi/cecapi` folder from home:

    ```bash
    git clone https://github.com/Marcus-L/cecapi.git
    ```

1. Install the service

    ```bash
    cd cecapi
    sudo ./install.sh
    ```

    It performs a few steps for you:

    * Creates the `flask` virtual environment
    * Installs flask into it with `pip`
    * Moves the `cecapi.service` file to `/lib/systemd/system`, sets permissions on the file, reloads daemons and starts the service.

1. Test the install

    ```bash
    sudo systemctl status cecapi.service

    # start/stop service with:
    sudo systemctl stop cecapi.service
    sudo systemctl start cecapi.service
    ```

## Note

There's no security. The assumption is that you're running this behind a firewall...

## Using the API

Turn Off TV
```bash
curl -X GET http://127.0.0.1:50002/on
curl -X GET http://127.0.0.1:50002/off
```

Turn On TV

## Troubleshooting

See if you can run the command from the shell, if not maybe your TV or HDMI cable does not support CEC:
```bash
echo "standby 0" | cec-client -s
echo "on 0" | cec-client -s
```