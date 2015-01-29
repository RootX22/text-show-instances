{-# LANGUAGE CPP #-}
{-|
Module:      Properties
Copyright:   (C) 2014-2015 Ryan Scott
License:     BSD-style (see the file LICENSE)
Maintainer:  Ryan Scott
Stability:   Experimental
Portability: GHC

@QuickCheck@ tests for @text-show-instances@.
-}
module Main (main) where

import Properties.Compiler.Hoopl            (hooplTests)
import Properties.Control.Applicative.Trans (applicativeFunctorTransformerTests)
import Properties.Control.Monad.Trans       (monadTransformerTests)
import Properties.Data.Binary               (binaryTests)
import Properties.Data.Containers           (containersTests)
import Properties.Data.Functor.Trans        (functorTransformerTests)
import Properties.Data.List.NonEmpty        (nonEmptyListTests)
import Properties.Data.Semigroup            (semigroupTests)
import Properties.Data.String.UTF8          (utf8StringTests)
import Properties.Data.Tagged               (taggedTests)
import Properties.Data.Time                 (timeTests)
import Properties.Data.UnorderedContainers  (unorderedContainersTests)
import Properties.Data.Vector               (vectorTests)
import Properties.Language.Haskell.TH       (templateHaskellTests)
import Properties.System.Console.Haskeline  (haskelineTests)
import Properties.System.Directory          (directoryTests)
import Properties.System.Locale             (oldLocaleTests)
#if !defined(mingw32_HOST_OS)
import Properties.System.Console.Terminfo   (terminfoTests)
import Properties.System.Posix              (unixTests)
#endif
import Properties.System.Random             (randomTests)
import Properties.System.Time               (oldTimeTests)
#if defined(mingw32_HOST_OS)
import Properties.System.Win32              (win32Tests)
#endif
import Properties.Text.PrettyPrint          (prettyTests)
import Properties.Text.XHtml                (xhtmlTests)
import Properties.Trace.Hpc                 (hpcTests)

import Test.Tasty (TestTree, defaultMain, testGroup)

main :: IO ()
main = defaultMain testTree

testTree :: TestTree
testTree = testGroup "QuickCheck properties" allTests

allTests :: [TestTree]
allTests = concat [ hooplTests
                  , applicativeFunctorTransformerTests
                  , monadTransformerTests
                  , binaryTests
                  , containersTests
                  , functorTransformerTests
                  , nonEmptyListTests
                  , semigroupTests
                  , utf8StringTests
                  , taggedTests
                  , timeTests
                  , unorderedContainersTests
                  , vectorTests
                  , templateHaskellTests
                  , haskelineTests
                  , directoryTests
                  , oldLocaleTests
#if !defined(mingw32_HOST_OS)
                  , terminfoTests
                  , unixTests
#endif
                  , randomTests
                  , oldTimeTests
#if defined(mingw32_HOST_OS)
                  , win32Tests
#endif
                  , prettyTests
                  , xhtmlTests
                  , hpcTests
                  ]