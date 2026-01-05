# env.nu
#
# Installed by:
# version = "0.107.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

zoxide init nushell | save -f ~/.zoxide.nu

$env.PATH = ($env.PATH | append ~/.local/bin)
$env.PATH = ($env.PATH | append ~/.claude/local)
# Add SDKMAN Java to PATH
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.sdkman/candidates/java/current/bin")

# Set JAVA_HOME
$env.JAVA_HOME = $"($env.HOME)/.sdkman/candidates/java/current"
