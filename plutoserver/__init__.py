import os

def setup_plutoserver():
  mydir = os.path.dirname(os.path.realpath(__file__))
  iconpath = os.path.join(mydir, 'icons', 'pluto-logo.svg')
  return {
    "command": ["julia", "--optimize=0", "-e", "import Pluto; Pluto.run(host=\"0.0.0.0\", port={port}, launch_browser=false, require_secret_for_open_links=false, require_secret_for_access=false)"],
    "timeout": 60,
    "launcher_entry": {
        "title": "Pluto.jl",
        "icon_path": iconpath
    },
  }
