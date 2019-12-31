# Snooze

Random Powershell experimentation on Windows.

## How to run Powershell

On Windows 10, click on the magnifying glass and type the following:

```shell
powershell -ExecutionPolicy bypass
```

## Basic Usage

Once the Powershell shell is running, and you're `cd`'d into the correct directory, run stuff like this: `.\hello_world.ps1`

## Dev Environment Setup

1. Download and install git: `/home/ndr/Desktop/dev/git/snooze/`
1. In the 'magnifying glass' : `powershell -ExecutionPolicy bypass`
1. In that shell:

```shell
cd $HOME\Desktop
mkdir git
cd git
git clone https://github.com/call-me-nick/snooze.git
cd snooze
```
