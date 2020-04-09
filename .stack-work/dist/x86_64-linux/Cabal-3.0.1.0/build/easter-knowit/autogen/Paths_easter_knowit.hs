{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_easter_knowit (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/c/Users/MortenAske/easter-knowit/.stack-work/install/x86_64-linux/2e191adfd8cc77a664cf6d3c8be6c57964be7da49f78b76934e77ab3ce187fc9/8.8.3/bin"
libdir     = "/mnt/c/Users/MortenAske/easter-knowit/.stack-work/install/x86_64-linux/2e191adfd8cc77a664cf6d3c8be6c57964be7da49f78b76934e77ab3ce187fc9/8.8.3/lib/x86_64-linux-ghc-8.8.3/easter-knowit-0.1.0.0-LBch9D9ctDs2k0U3W9mGhp-easter-knowit"
dynlibdir  = "/mnt/c/Users/MortenAske/easter-knowit/.stack-work/install/x86_64-linux/2e191adfd8cc77a664cf6d3c8be6c57964be7da49f78b76934e77ab3ce187fc9/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/mnt/c/Users/MortenAske/easter-knowit/.stack-work/install/x86_64-linux/2e191adfd8cc77a664cf6d3c8be6c57964be7da49f78b76934e77ab3ce187fc9/8.8.3/share/x86_64-linux-ghc-8.8.3/easter-knowit-0.1.0.0"
libexecdir = "/mnt/c/Users/MortenAske/easter-knowit/.stack-work/install/x86_64-linux/2e191adfd8cc77a664cf6d3c8be6c57964be7da49f78b76934e77ab3ce187fc9/8.8.3/libexec/x86_64-linux-ghc-8.8.3/easter-knowit-0.1.0.0"
sysconfdir = "/mnt/c/Users/MortenAske/easter-knowit/.stack-work/install/x86_64-linux/2e191adfd8cc77a664cf6d3c8be6c57964be7da49f78b76934e77ab3ce187fc9/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "easter_knowit_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "easter_knowit_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "easter_knowit_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "easter_knowit_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "easter_knowit_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "easter_knowit_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
