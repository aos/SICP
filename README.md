# Structure and Interpretation of Computer Programs (SICP)

Notes, examples, and exercises in Scheme for [SICP](https://mitpress.mit.edu/sites/default/files/sicp/index.html)

I am currently using this [unofficial modernized online version](https://sarabander.github.io/sicp/) of SICP.

### Folder structure

- **Exercises** and **notes** sit in the [exercises](exercises) folder.
```
exercises/
├── ch1                       <- chapter
│   ├── 1                     <- section
│   │   ├── conditionals.ss   <- notes
│   │   ├── ex-2.ss           <- exercises prepended with 'ex-#number'
│   │   ├── ex-3.ss
│   │   ├── ex-6.ss
```

- **[book](book)** is just a local copy of the online version linked above. I made some
local changes including fixing small misspellings and reverting from `*.xhtml`
to `*.html` because it didn't play nicely with my vim browser keybindings.

- **[scm.sh](scm.sh)** and **[scheme_completion.txt](scheme_completion.txt)** are
used locally to start a readline-wrapped Scheme REPL.

### Progress

- [x] Chapter 1
- [x] Chapter 2
- [x] Chapter 3
- [x] Chapter 4
- [x] Chapter 5

**Note**: Regarding chapter 5, everything is complete except for exercises
**5.51** and **5.52**. I plan on learning a new language to implement these
last two exercises!
