# ❄️ My NixOS Configuration

A minimal and modular NixOS & Home Manager configuration, built from the ground up for portability and clarity using Flakes.

## ✨ Features

- [cite\_start]🖥️ **Portable by Design**: Works on NixOS and non-NixOS systems [Linux/macOS](cite: 59).
- [cite\_start]🧩 **Modular & Reusable**: Logic is cleanly separated from user-specific data (`config.nix`)[cite: 48, 49].
- ❄️ **Flake-Managed**: For a reproducible and reliable environment.
- [cite\_start]🏠 **Home Manager Integrated**: Manages user-level dotfiles and packages declaratively[cite: 44].
- [cite\_start]🎨 **Stylix Ready**: Declarative theming and styling integrated[cite: 45].
- [cite\_start]🖋️ **NixVim Ready**: A modular Neovim configuration managed by Nix[cite: 46].

-----

## 🚀 Installation

Follow these steps to get this configuration up and running on your machine.

### 1\. Prerequisites

Ensure you have **Nix installed** with **Flakes enabled**. For a fresh NixOS install, this is typically handled during the installation process.

### 2\. Clone the Repository

Clone this repository to a persistent location on your new machine. A common choice is `~/.config/nixos-config`.

```bash
# Example location, change if you prefer
git clone https://github.com/your-github-username/your-repo-name.git ~/.config/nixos-config
cd ~/.config/nixos-config
```

### 3\. Configure Your System

This flake separates machine-specific values from the core logic. You must provide these values before building.

1. **Copy the example configuration:**

    ```bash
    cp config.example.nix config.nix
    ```

2. **Edit `config.nix`**: Open the newly created `config.nix` file and fill in the following fields according to your new machine's details:
      - [cite\_start]`username`: Your user account name on the new machine[cite: 28].
      - [cite\_start]`hostname`: The desired hostname for the new machine[cite: 28]. This must match a directory name inside the `hosts/` directory (e.g., "hubris", "loom").
      - [cite\_start]`gpuVendor`: The graphics card vendor, e.g., "nvidia", "amd", or "intel"[cite: 29].

-----

### 4\. Build and Apply the Configuration

With your `config.nix` file correctly set up, you can now build the system.

#### For NixOS Systems

This command will build the entire system configuration (OS + user environment) and apply it.

> **📝 Note for Fresh Installations:**
> After a fresh install of NixOS, a `hardware-configuration.nix` file is generated in `/etc/nixos/`. You **must** copy this machine-specific file into your configuration before building. This file tells NixOS about your specific hardware, like disks and drivers.
>
> ```bash
> # Replace 'your-hostname-here' with the name of your host directory
> sudo cp /etc/nixos/hardware-configuration.nix ./hosts/your-hostname-here/
> ```

Now, build and apply the configuration:

```bash
# Make sure you are in the repository directory
# Replace 'your-hostname-here' with the hostname you set in config.nix
sudo nixos-rebuild switch --flake .#your-hostname-here
```

Your system will now be configured according to your flake. Reboot if necessary to ensure all services (like the display manager) start correctly.

#### For non-NixOS Systems (Linux/macOS)

[cite\_start]If you are only managing your user environment (dotfiles) on a non-NixOS machine, use the Home Manager command[cite: 59].

```bash
# Replace 'your-username-here' with the username you set in config.nix
home-manager switch --flake .#your-username-here
```

-----

## 📂 Repository Structure

- `flake.nix`: The entry point. [cite\_start]Defines dependencies and outputs for both NixOS and Home Manager[cite: 43].
- [cite\_start]`config.nix`: **(You create this)** Your local, unversioned machine-specific details[cite: 49].
- [cite\_start]`hosts/`: Contains configurations specific to each machine [e.g., hardware settings, unique packages](cite: 51).
- `modules/`: The core of the configuration.
  - `system/`: Modules applied to the entire NixOS system.
  - `home/`: Modules applied to your user environment via Home Manager.

-----

## 🔄 Maintenance

To update your system and packages to the latest versions from your flake inputs:

1. **Update Flake Inputs:**

    ```bash
    nix flake update
    ```

2. **Rebuild Your System:**

    ```bash
    # For NixOS
    sudo nixos-rebuild switch --flake .#your-hostname-here

    # For non-NixOS
    home-manager switch --flake .#your-username-here
    ```
