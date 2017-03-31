Setup:

  $ . $TESTDIR/setup.sh
  $ printf 'foo\n' > ./.gitignore
  $ touch .git
  $ mkdir dir
  $ printf 'foo_subdir\n' > ./dir/foo

Matching from subdirectory reads .gitignore from parent dirs:

  $ cd dir
  $ ag foo
  [1]

