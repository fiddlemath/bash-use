bash-use
========

A very flexible Bash module manager.

A `use` script is a handful of modifications to your Bash environment. Like [modules](http://modules.sourceforge.net/), this is highly useful if you want to share library packages and whatnot with others, or if you just want to keep your own environment clean.

To set up, put your `use` scripts in some single directory, and set `use_script_dir` to that directory.
Then, put `. use-init.sh` in your Bash profile. To see your use script names, utter `use` on the command line; to invoke a use script on the current environment, say `use <script>`.

Design principles:

- Keep the driver script small.
- Write individual `use` scripts in whatever language you want; output Bash commands.
