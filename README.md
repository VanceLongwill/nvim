## NVIM config
### useful shit 

#### Movement 


down  &  up
`ctrl+d ctrl+u`

inside quotes/brackets use
`yi'`
`ci(`

go to prev/next instance of current word `*` / `#`

Between braces {}
`%`

#### Git

`
:Gstatus
`
while in git status. `O` to open file in new tab, `-` to stage file, `U` to discard changes from file, `dv` for a verical split diff, `q` to exit
`
:Gblame
`

Closing a buffer

`:bd`

Nerdtree


Get current file path  & paste 
in insert mode 
`ctrl+R %`

Between tabs
cycle forward `gt`
cycle back `gT`
specific tab `${number}gt` e.g `4gt` -> tab number 4

Reopen last closed tab

`:tabnew#`

scroll the line with the cursor to the center of the screen
`zz`


Replace in CWD:

 - Now we want to run Vim's substitute command inside every file in the quickfix list. We can do this using the :cfdo {cmd} command which executes {cmd} in each file in the quickfix list. The specific {cmd} we want to use is substitute or s for short. The full line would look like:

- `:cfdo %s/Sam/Bob/g`
You can add the c flag to confirm all replacements if you like:

- `:cfdo %s/Sam/Bob/gc`

    Save changes
- `:cfdo update`

surround.vim
============

Surround.vim is all about "surroundings": parentheses, brackets, quotes,
XML tags, and more.  The plugin provides mappings to easily delete,
change and add such surroundings in pairs.

It's easiest to explain with examples.  Press `cs"'` inside

    "Hello world!"

to change it to

    'Hello world!'
+
Now press `cs'<q>` to change it to

    <q>Hello world!</q>

To go full circle, press `cst"` to get

    "Hello world!"

To remove the delimiters entirely, press `ds"`.

    Hello world!

Now with the cursor on "Hello", press `ysiw]` (`iw` is a text object).

    [Hello] world!

Let's make that braces and add some space (use `}` instead of `{` for no
space): `cs]{`

    { Hello } world!

Now wrap the entire line in parentheses with `yssb` or `yss)`.

    ({ Hello } world!)

Revert to the original text: `ds{ds)`

    Hello world!

Emphasize hello: `ysiw<em>`

    <em>Hello</em> world!

Finally, let's try out visual mode. Press a capital V (for linewise
visual mode) followed by `S<p class="important">`.

    <p class="important">
      <em>Hello</em> world!
    </p>

This plugin is very powerful for HTML and XML editing, a niche which
currently seems underfilled in Vim land.  (As opposed to HTML/XML
*inserting*, for which many plugins are available).  Adding, changing,
and removing pairs of tags simultaneously is a breeze.

The `.` command will work with `ds`, `cs`, and `yss` if you install
[repeat.vim](https://github.com/tpope/vim-repeat).
