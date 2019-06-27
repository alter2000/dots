self: super:

{
  pyPkgs = super.pyPkgs or {} // {
    tim = super.callPackage ../pkgs/tim.nix;
    pyEnv = self.python37.withPackages(ps: with ps; [
      ipython
      python
      pip
      virtualenv
      requests

      yapf
      # neovim
      mps-youtube
      # terminal_velocity
    ]);
  };

  devPkgs = super.devPkgs or {} // {
    tig = self.tig;
    gitRepo = self.gitRepo;

    platformio = self.platformio;
    clang = self.clang;
    binutils-unwrapped = self.hiPrio self.binutils-unwrapped;

    ghc = self.hiPrio self.ghc;
    stack = self.stack;

    rustup = self.rustup;

    fatcat = super.callPackage ../pkgs/fatcat.nix {};

    tcsh = self.tcsh;
    ctags = self.ctags;
    valgrind = self.valgrind;

    qemu = self.qemu;
    vagrant = self.vagrant;
    virtmanager = self.virtmanager;

    ansible-lint = self.ansible-lint;
    vim-vint = self.vim-vint;
    shfmt = self.shfmt;
    mypy = self.mypy;
    htmlTidy = self.htmlTidy;
  };

  jetbrainsPkgs = super.jetbrainsPkgs or {} // {
    clion = self.jetbrains.clion;
    datagrip = self.jetbrains.datagrip;
    pycharm-professional = self.jetbrains.pycharm-professional;
    webstorm = self.jetbrains.webstorm;
  };

  androidPkgs = super.androidPkgs or {} // {
    android-studio = self.android-studio;
    apktool = self.apktool;
    genymotion = self.genymotion;
  };
}
