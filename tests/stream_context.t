Setup:

  $ echo "_" > test.txt
  $ echo "aclocal.m4" >> test.txt
  $ echo "ag" >> test.txt
  $ echo "ag.bashcomp.sh" >> test.txt
  $ echo "autom4te.cache" >> test.txt
  $ echo "build.sh" >> test.txt
  $ echo "compile" >> test.txt
  $ echo "config.guess" >> test.txt
  $ echo "config.log" >> test.txt
  $ echo "config.status" >> test.txt
  $ echo "config.sub" >> test.txt
  $ echo "configure" >> test.txt
  $ echo "configure.ac" >> test.txt
  $ echo "CONTRIBUTING.md" >> test.txt
  $ echo "depcomp" >> test.txt
  $ echo "_.diff" >> test.txt
  $ echo "doc" >> test.txt
  $ echo "format.sh" >> test.txt
  $ echo "fzfd.sh" >> test.txt
  $ echo "install-sh" >> test.txt
  $ echo "LICENSE" >> test.txt
  $ echo "m4" >> test.txt
  $ echo "Makefile" >> test.txt
  $ echo "Makefile.am" >> test.txt
  $ echo "Makefile.in" >> test.txt
  $ echo "Makefile.w32" >> test.txt
  $ echo "missing" >> test.txt
  $ echo "NOTICE" >> test.txt
  $ echo "README.md" >> test.txt
  $ echo "results" >> test.txt
  $ echo "src" >> test.txt
  $ echo "test" >> test.txt
  $ echo "test_G" >> test.txt
  $ echo "test_gitign" >> test.txt
  $ echo "test_perl" >> test.txt
  $ echo "tests" >> test.txt
  $ echo "test_trail_spc" >> test.txt
  $ echo "_the_silver_searcher" >> test.txt
  $ echo "the_silver_searcher.spec" >> test.txt
  $ echo "the_silver_searcher.spec.in" >> test.txt
  $ echo "w" >> test.txt

Search for lines matching "t" in piped test.txt (-C2):

  $ cat test.txt | "$TESTDIR/../ag" -C2 t --number
  3-ag
  4-ag.bashcomp.sh
  5:autom4te.cache
  6-build.sh
  7-compile
  8-config.guess
  9-config.log
  10:config.status
  11-config.sub
  12-configure
  13-configure.ac
  14:CONTRIBUTING.md
  15-depcomp
  16-_.diff
  17-doc
  18:format.sh
  19-fzfd.sh
  20:install-sh
  21-LICENSE
  22-m4
  --
  26-Makefile.w32
  27-missing
  28:NOTICE
  29-README.md
  30:results
  31-src
  32:test
  33:test_G
  34:test_gitign
  35:test_perl
  36:tests
  37:test_trail_spc
  38:_the_silver_searcher
  39:the_silver_searcher.spec
  40:the_silver_searcher.spec.in
  41-w

Search for lines matching "t" in piped test.txt (-A1 -B2):

  $ cat test.txt | "$TESTDIR/../ag" -A1 -B2 t --number
  3-ag
  4-ag.bashcomp.sh
  5:autom4te.cache
  6-build.sh
  --
  8-config.guess
  9-config.log
  10:config.status
  11-config.sub
  12-configure
  13-configure.ac
  14:CONTRIBUTING.md
  15-depcomp
  16-_.diff
  17-doc
  18:format.sh
  19-fzfd.sh
  20:install-sh
  21-LICENSE
  --
  26-Makefile.w32
  27-missing
  28:NOTICE
  29-README.md
  30:results
  31-src
  32:test
  33:test_G
  34:test_gitign
  35:test_perl
  36:tests
  37:test_trail_spc
  38:_the_silver_searcher
  39:the_silver_searcher.spec
  40:the_silver_searcher.spec.in
  41-w

Search for lines matching "t" in piped test.txt (-A2 -B1):

  $ cat test.txt | "$TESTDIR/../ag" -A2 -B1 t --number
  4-ag.bashcomp.sh
  5:autom4te.cache
  6-build.sh
  7-compile
  --
  9-config.log
  10:config.status
  11-config.sub
  12-configure
  13-configure.ac
  14:CONTRIBUTING.md
  15-depcomp
  16-_.diff
  17-doc
  18:format.sh
  19-fzfd.sh
  20:install-sh
  21-LICENSE
  22-m4
  --
  27-missing
  28:NOTICE
  29-README.md
  30:results
  31-src
  32:test
  33:test_G
  34:test_gitign
  35:test_perl
  36:tests
  37:test_trail_spc
  38:_the_silver_searcher
  39:the_silver_searcher.spec
  40:the_silver_searcher.spec.in
  41-w

