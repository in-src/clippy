Clippy 
================================================

This is a ZeroClipboard compatible clippy. 

Usage
------------------------
You need to set the clip text via params instead of calling method. The height
and width of the flash should also be set as params.

The callbacks of ZeroClipboard are called.

Compiling
------------------------

In order to compile Clippy from source, you need to install the following:

* [haXe](http://haxe.org/)
* [swfmill](http://swfmill.org/)

The haXe code is in `clippy.hx`, the button images are in `assets`, and the
compiler config is in `compile.hxml`. Make sure you look at all of these to
see where and what you'll need to modify. To compile everything into a final
SWF, run the following from Clippy's root directory:

    swfmill simple library.xml library.swf && haxe compile.hxml

If that is successful, copy `build/clippy.swf` to your
`public` directory or wherever your static assets can be found.

License
-------

MIT License (see LICENSE file)
