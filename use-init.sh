# use: Run requested scripts; execute the output of those scripts in this shell.

# Include this in your Bash startup file, write custom configuration
# stuff in other languages (e.g. Python, Ruby, Perl), and have it
# systematically produce output that will effect this shell's
# environment.

# This is intended to make it easier to juggle many types of settings on one machine.
# If you want to write a `use` script in plain Bash, make its first line #!/bin/cat

function use() {
    use_script_dir="$HOME/scripts/use"
    if [[ -z $1 ]]
    then 
        echo "Call 'use' with one of the 'use' scripts:"
        ls $use_script_dir
    else
        # For each requested command:
        for cmd in $*
        do
            # Find cmd -- if cmd is a absolute path, use it. Else, use paths relative to use_script_dir.
            if [[ $cmd != /* ]]
            then cmd=${use_script_dir}/${cmd}
            fi
            # eval each line that $cmd outputs.
            while read line
            do
                eval $line
            done < <($cmd | sed -e '$a\') #sed: add trailing newline if absent.
        done
        hash -r #refresh PATH values.
    fi
}
