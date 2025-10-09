# config.nu
#
# Installed by:
# version = "0.107.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

# Aliases 
alias venv = overlay use .venv/bin/activate.nu
alias v = nvim


# Homebrew setup
if ("/home/linuxbrew/.linuxbrew/bin/brew" | path exists) {
    # Execute brew shellenv and parse the export statements
    let brew_env = (^/home/linuxbrew/.linuxbrew/bin/brew shellenv 
        | lines 
        | where ($it | str starts-with "export ")
        | each { |line|
            # Parse export statements: export VAR="value";
            let parsed = ($line | str replace 'export ' '' | str replace ';' '' | parse '{name}="{value}"')
            if not ($parsed | is-empty) {
                {name: $parsed.0.name, value: $parsed.0.value}
            }
        }
        | where ($it | is-not-empty)
    )
    
    # Set each environment variable
    for env_var in $brew_env {
        if $env_var.name == "PATH" {
            # Handle PATH specially - expand ${PATH+:$PATH} pattern
            let new_path = ($env_var.value | str replace '\${PATH\+:\$PATH}' '')
            $env.PATH = ($new_path | split row ":" | append ($env.PATH | split row (char esep)) | uniq)
        } else {
            # Set other environment variables directly
            load-env {($env_var.name): $env_var.value}
        }
    }
}

$env.config = {
    edit_mode: vi
    show_banner: false
}

# Starship setup
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

#Zoxide
source ~/.zoxide.nu
