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

bindir     = "C:\\Users\\MortenAske\\easter-knowit\\.stack-work\\install\\8e9e5a75\\bin"
libdir     = "C:\\Users\\MortenAske\\easter-knowit\\.stack-work\\install\\8e9e5a75\\lib\\x86_64-windows-ghc-8.8.3\\easter-knowit-0.1.0.0-86KqWlTCqSCIu7WeZsULE7-easter-knowit"
dynlibdir  = "C:\\Users\\MortenAske\\easter-knowit\\.stack-work\\install\\8e9e5a75\\lib\\x86_64-windows-ghc-8.8.3"
datadir    = "C:\\Users\\MortenAske\\easter-knowit\\.stack-work\\install\\8e9e5a75\\share\\x86_64-windows-ghc-8.8.3\\easter-knowit-0.1.0.0"
libexecdir = "C:\\Users\\MortenAske\\easter-knowit\\.stack-work\\install\\8e9e5a75\\libexec\\x86_64-windows-ghc-8.8.3\\easter-knowit-0.1.0.0"
sysconfdir = "C:\\Users\\MortenAske\\easter-knowit\\.stack-work\\install\\8e9e5a75\\etc"

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
  return (dir ++ "\\" ++ name)
