## TOC


<!--toc:start-->
- [What are we talking about?](#what-are-we-talking-about)
- [Content](#content)
<!--toc:end-->

## :art: Author :art:
Owner : Guglielmi Matteo [@github](https://github.com/MatteoGuglielmi-tech)

## :thinking_face: What are we talking about? :thinking_face:
This repository contains a revisited and extended configuration of [NvChad](https://nvchad.com/), a **blazing fast Neovim config** providing solid default and a beautiful UI. The advantage in using NvChad is that it provides a set of
feature that's exhaustive and sufficient for the majority of the users. It is also a good way to get close to the Vim world which is fascinating and pretty harsh at the same time. Indeed, all the Vim based editor, such as Neovim, LunarVim
or AstroVim, require lots of configuration sometimes not that trivial. NvChad comes to the rescue and provides a **ready to use config with lots of features** (for the whole list, please refer to 
[plugin list](https://github.com/NvChad/NvChad#plugins-list).  

## :mag_right: Content :mag_right:
This repository presents the following structure:
```bash
.
.
├── LICENSE
├── README.md
├── init.lua
└── lua
    ├── core
    │   ├── bootstrap.lua
    │   ├── default_config.lua
    │   ├── init.lua
    │   ├── mappings.lua
    │   └── utils.lua
    ├── custom
    │   ├── chadrc.lua
    │   ├── configs
    │   │   ├── lspconfig.lua
    │   │   ├── null-ls.lua
    │   │   └── overrides.lua
    │   ├── highlights.lua
    │   ├── init.lua
    │   ├── mappings.lua
    │   └── plugins.lua
    └── plugins
        ├── configs
        │   ├── cmp.lua
        │   ├── lazy_nvim.lua
        │   ├── lspconfig.lua
        │   ├── mason.lua
        │   ├── nvimtree.lua
        │   ├── others.lua
        │   ├── telescope.lua
        │   ├── treesitter.lua
        │   └── whichkey.lua
        └── init.lua
```
where:
- the outer most `init.lua` bootstraps [folke/lazy.nvim](https://github.com/folke/lazy.nvim);
- within the `lua` folder it is possible to find all the configuration files for all the used plugins. The most important and interesting ones reside in the `custom` folder where the user has the possibility to modify settings, add new plugins and mappings following his own taste as specified in the [NvChad doc](https://nvchad.com/docs/quickstart/install);
    - In particular, besides the default plugins provided by the NvChad config, the following plugins have been injected:
        - `copilot.vim` : GitHub Copilot uses OpenAI Codex to suggest code and entire functions in real-time right from your editor. Trained on billions of lines of public code, GitHub Copilot turns natural language prompts including comments and method names into coding suggestions across dozens of languages. (requires subscription);
        - `null-ls.lua`: allow to use Neovim as language server to integrate LSP related capabilities (for more details, refer to [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim));
        - `mason-null-ls.nvim` : bridges some gaps between mason.nvim and null-ls. It allows you to automatically install, and automatically set up a predefined list of sources;
        - `vim-fugitive` by tpope : provides and amazing git integration;
        - `gv.vim` : allows to easily surf the commit browser
        - `nvim-ts-rainbow2` : to have coloured matching parenthesis exploiting treesitter highlighting capabilities;

On top of this, minor changes has been made, i.e. some of the mappings have been modified to match my personal taste. 
