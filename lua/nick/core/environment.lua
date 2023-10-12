-- Environment

HOME = os.getenv("HOME")
XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME") or HOME .. "/.config"

nvim_config_dir = XDG_CONFIG_HOME .. "/nvim"
code = HOME .. "/code"
