Setup:

  $ alias iterpath="$TESTDIR/../iterpath"
  $ alias iterpath_win32="$TESTDIR/../iterpath_win32"

Empty path is not recognized as a filesystem root:

  $ iterpath ""
  
  $ iterpath_win32 ""
  

Slash is recognized as a filesystem root:

  $ iterpath /
  /
  ROOT
  $ iterpath_win32 /
  /
  ROOT

Multiple slashes are recognized as a filesystem root:

  $ iterpath //
  //
  ROOT
  $ iterpath_win32 //
  //
  ROOT

  $ iterpath ///
  ///
  ROOT
  $ iterpath_win32 ///
  ///
  ROOT

Forward-slash paths are iterated:

  $ iterpath a/b/c
  a/b/c
  a/b/
  a/
  $ iterpath_win32 a/b/c
  a/b/c
  a/b/
  a/

  $ iterpath a/b//c///
  a/b//c///
  a/b//
  a/
  $ iterpath_win32 a/b//c///
  a/b//c///
  a/b//
  a/

