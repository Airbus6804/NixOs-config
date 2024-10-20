SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
python -m venv $SCRIPT_DIR
$SCRIPT_DIR/bin/pip3 install pyelftools capstone
$SCRIPT_DIR/bin/python3 patcher.py /home/$USER/.config/discord/0.0.71/modules/discord_krisp/discord_krisp.node
