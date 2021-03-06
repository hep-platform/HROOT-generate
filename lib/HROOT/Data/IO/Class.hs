-- |
-- Module      : HROOT.Data.IO.Class
-- Copyright   : (c) 2011-2013 Ian-Woo Kim
-- 
-- License     : LGPL-2
-- Maintainer  : ianwookim@gmail.com
-- Stability   : experimental
-- Portability : GHC
--
-- conversion data for ROOT classes 
--

module HROOT.Data.IO.Class where

import Data.Monoid 
--
import FFICXX.Generate.Type.Class
import FFICXX.Generate.Type.Module
-- 
import HROOT.Data.Core.Class

iocabal = Cabal { cabal_pkgname = "HROOT-io"
                  , cabal_cheaderprefix = "HROOTIO" 
                  , cabal_moduleprefix = "HROOT.IO" } 

ioclass n ps ann fs = Class iocabal n ps ann Nothing fs 

tDirectoryFile :: Class
tDirectoryFile = 
  ioclass "TDirectoryFile" [tDirectory] mempty
  [ {-  Virtual (cppclass_ "TList") "GetListOfKeys" []  -}
  ]

tFile :: Class
tFile = ioclass "TFile" [tDirectoryFile] mempty
        [ Constructor [cstring "fname", cstring "option", cstring "ftitle", int "compress" ] Nothing
        ]


io_classes :: [Class]
io_classes = 
  [ tDirectoryFile, tFile ] 

io_topfunctions = [] 






