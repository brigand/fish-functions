Some useful functions I use with the [fish] shell. Some of these only work on OSX but could be easily adapted to linux by changing paths.

[fish]: http://fishshell.com/

## pvim

Edit the clipboard with vim. Useful because you can't pipe things to/from interactive terminal apps.

```
$ pvim
<vim opens>
:wq
Copy to clipboard? (yN) y
```

It actually takes a command to eval, but it defaults to `pbpaste`.

```
$ pvim seq 1 3
<vim opens>
sOne # change the first line to "One"
:wq
Copy to clipboard? (yN) y
$ pbpaste
One
2
3
```

## chrome-profile

This is one that I use constantly. You run it and it behaves like you installed chrome multiple times.

It lets you have different settings, google accounts, extensions, and sessions for different companies/projects.

Press ctrl-c to kill it, or just make the chrome instance quit.

```
$ chrome-profile my-org
<misc debug logs you can ignore>
```

## cd-pretty/cd-pretty-alias

Currently not that pretty. Just changes to the directory and `ls -l`. I'll be making this better.

I mainly use `cd-pretty-alias` in config.fish as shortcuts for navigation to common places.

```
$ cd-pretty ~/Documents
...
$ cd-pretty-alias doc ~/Documents
$ cd-doc
...
```

## table

Takes each line of stdin and prints it as a table that fits in your terminal.

```
$ cat lorem-ipsum | tr ' ' '\n' | table
Lorem         ipsum         dolor         sit           amet,         consectetur
adipiscing    elit.         Fusce         id            dui           nec
nunc          pharetra      elementum     eu            quis          dui.
Mauris        sed           feugiat       purus,        non           eleifend
urna.         Donec         efficitur     cursus        accumsan.     Quisque
vitae         diam          ut            lorem         egestas       viverra
non           at            eros.         Nullam        tellus        erat,
ullamcorper   nec           mi            vitae,        volutpat      rutrum
libero.       Cras          mattis        dolor         at            lacus
dapibus       bibendum.     Vestibulum    turpis        felis,        posuere
vitae         enim          et,           dapibus       suscipit      metus.
Mauris        accumsan      massa         iaculis,      ornare        felis
eget,         scelerisque   ligula.       Aenean        neque         quam,
sollicitudin  non           tempor        id,           luctus        non
turpis.       Aliquam       tincidunt     sodales       metus,        at
ultricies     mi.           Sed           semper        vitae         ante
ac            viverra.      Duis          sed           condimentum   erat,
non           sollicitudin  velit.
```

## kill-on-port

Kills whatever is using the port we want. It also tells you the command used to start the server, in case you killed something you shouldn't have.

```
$ kill-on-port 8080
Pew! Pew!
We killed node server.js
$ kill-on-port 8080
It was not very effective
```

## port-user

Maybe you want to see what's on the port before you kill it?

```
$ port-user 8080
COMMAND
node server.js
PID: 78914
CMD: node server.js
```

## mkcd

Just an alias for `mkdir -p $x; and cd $x`.

```
$ mkcd /tmp/foo/bar/baz
$ pwd
/tmp/foo/bar/baz
```

## ding

Just prints the alert character and waits a second. I put it after commands sometimes.

```
$ sleep 30; ding; ding; ding
```

## git-recent

Shows diffs of recent commits. Press `q` to go to the next commit, or ctrl-c to exit.

## td

Create a temporary directory with a random name. And then go there. I use this *a lot* when I want to do a quick test.

## ql

OSX's quick look on the command line. Just opens a preview for whatever, escape closes it.

```
$ ql img.png
```

## gist

Create an anonamyous gist from a single file. Copies the url to the clipboard.

```
$ gist file.txt
```

## gist-repo

Works great with td. This one is actually really complicated, but it makes the current directory a git repo, creates a gist, and force pushed the repo to the gist.

It also creates three utility files in the repo.

### push

Does a force push to the repo. You need to use this.

### copy

Copy the gist url to your clipboard

### open

Open the gist in your default browser

### Usage

You need to have the `GITHUB_GIST_OAUTH_TOKEN` env var set. You can generate one from account settings on github. I just put it in my config.fish.

```
$ td
$ gist-repo
$ echo 'test' > file.txt
$ git add file.txt
$ git commit -am 'initial'
$ ./push
$ ./copy
```

## git-cd/git-clone

This is only useful to people that organize code repos by github user/repo. You'll want to modify the first two lines of the function
to point to your project root, and the default user to use.

If not supplied an argument, it'll list all of the repos.

```
$ git-cd my-repo
$ git-cd brigand/my-repo # same as above if your name is 'brigand'
$ git-cd some-org
$ git-cd some-org/some-repo
$ git-cd | grep stream # find user/repo
- brigand/concat-stream
- substack/concat-stream
- substack/concat-stream
```

The `git-clone` function also works with this structure.

```
$ git-clone user/repo
<git output>
$ pwd
~/github/user/repo
```

## cawk

Colored awk. You're going to have to use your imagination, but it prints 'a b c' with each letter a different color. Only RGB are supported for now.

```
$ echo 'a b c' | cawk '{red($1) green($2) blue($3)}'
a b c
```

