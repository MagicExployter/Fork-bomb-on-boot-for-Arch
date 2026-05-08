#Run any script/command on boot

## THIS IS A W.I.P
It might have some problems or not work. I dont wanna test it because I'm too lazy.

## Running it (VERY IMPORTANT)

Before you can run the script, you need to make it executable bc Linux won't run it otherwise:

```bash
chmod +x on-boot.sh
```

Then to install it as a boot service:

```bash
sudo bash on-boot.sh --install
```

`sudo` is required since the script interacts with systemd. Once installed, it will run automatically every time your system starts up, with no further interaction needed. could take up a bit of RAM depending on what you are running.


## Notes: 
- This works on any distro that uses systemd, like Ubuntu, Arch, Mint, and more.
- Be careful what you put in there, might be pretty bad. Also dont fork it and put something bad in the script part
- My second coding project


