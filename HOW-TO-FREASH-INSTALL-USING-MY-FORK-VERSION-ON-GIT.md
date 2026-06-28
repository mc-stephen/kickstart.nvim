That's actually a very common and sensible workflow. Many people using Kickstart do exactly that.

Here's the sequence I'd recommend:

1. Clone the original Kickstart into `~/.config/nvim`.
2. Launch `nvim` once so it installs all the plugins and dependencies.
3. Verify everything works.
4. Fork the Kickstart repository on GitHub.
5. Replace your local clone with your fork.
6. Customize it over time and push your changes to GitHub.

For example:

```bash
cd ~/.config
rm -rf nvim
git clone git@github.com:<your-username>/kickstart.nvim.git nvim
```

Or if you're using HTTPS:

```bash
git clone https://github.com/<your-username>/kickstart.nvim.git ~/.config/nvim
```

### Even easier: change the remote

Since you've already cloned the original repository, you don't actually have to delete it.

If you've already forked it, you can simply point your existing local repository to your fork.

Check your current remote:

```bash
git remote -v
```

It will probably show something like:

```text
origin  https://github.com/nvim-lua/kickstart.nvim.git
```

Then change it:

```bash
git remote set-url origin https://github.com/<your-username>/kickstart.nvim.git
```

Now:

```bash
git remote -v
```

will show your fork instead.

No need to reclone, and you keep everything exactly as it is.

### Keeping up with Kickstart updates

One thing I strongly recommend is adding the original repository as a second remote named `upstream`.

```bash
git remote add upstream https://github.com/nvim-lua/kickstart.nvim.git
```

Now you'll have:

```text
origin    -> your fork
upstream  -> official Kickstart
```

Whenever the Kickstart maintainers make improvements, you can fetch them:

```bash
git fetch upstream
```

and merge or rebase those changes into your own configuration when you're ready.

This is the same workflow many developers use when contributing to open-source projects.

### Your long-term workflow

It might look like this:

```text
GitHub
│
├── upstream (official Kickstart)
│
└── origin (your fork)
        │
        ▼
~/.config/nvim
        │
        ├── Add plugins
        ├── Change keymaps
        ├── Configure LSP
        ├── Customize themes
        └── Commit & push
```

Then on a new machine, setting up becomes as simple as:

```bash
git clone https://github.com/<your-username>/kickstart.nvim.git ~/.config/nvim
nvim
```

Neovim will install any missing plugins, and you'll have your exact configuration.

I also like this approach because, over time, your Neovim config becomes another one of your dotfiles. After a few months, you'll have a personalized setup that's version-controlled, easy to back up, and trivial to reproduce on any new computer.
