-- Environment

-- Programs
TERM = os.getenv("TERM") or "alacritty"

-- Directories
-- shell-environment-variable directories
HOME = os.getenv("HOME")
XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME") or HOME .. "/.config"

-- useful directories
code = HOME .. "/code"
