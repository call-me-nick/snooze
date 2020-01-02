# Snooze

Powershell experimentation on Windows.

## MISC

```cmd
# download nuget.exe
./nuget.exe install itext7 -Version j7.1.9 # will install in the current directory.


```

## How to run `generate_links.ps1`

The following instructions will generate a file called `my_links.csv` in the current working directory (as set in the instructions below).

1. Open a PowerShell window, as below.
1. In that window, use the `cd <drive letter` command to change your current working directory
1. Now `cd <to the directory where the PDF files are>`
to the base directory containing all files that you want indexed.
1. Run the `generate_links.ps1` command using the **absolute path** to the command. For example: `c:/users/TRettinghouse/Desktop/snooze/generate_links.ps1`
1. You have generated a file that can be opened with Excel. Do that.

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
