# Vim integration

This project is mainly written with Vim. As such, there's config files to aid with, among others, integration with Ale. Add this line to your .vimrc:

```
let g:local_vimrc = ['.vim', 'project.vim']
```

The compiler will handle the rest.
