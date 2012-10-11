# dlibgit - libgit2 D bindings

## Requirements
[DMD] 2.060+.
GDC can be used but you will have to compile on your own.
Use the import lib **libgit2.dll.a** in the **bin** folder when linking.

### Windows:
You're already set.

### Posix:
You need to build the libgit2 shared library (a specific commit is required):

    $ git clone -b development git://github.com/libgit2/libgit2.git
    $ cd libgit2 && git checkout acd1700630ea1159a55dc5e8cee12e4a725afe18
    
- Follow these instructions: http://libgit2.github.com/#install
- You might need to install zlib if cmake says it's missing (use your package manager to find the zlib dev package)

Make sure the libgit2 shared lib path is in your ld conf file.
For example, on Linux Mint libgit2 installs to `/usr/local/lib`, so either 
edit `/etc/ld.so.conf` or run:
  
    $ LD_LIBRARY_PATH=/usr/local/lib
    $ export LD_LIBRARY_PATH

[DMD]: http://dlang.org/download.html

## Building and running samples

    $ rdmd build.d samples/diff/diff.d
    $ bin\diff.exe .git 2504016ab220b5b 1e8ffc04be048c0
    
- This will diff the first two commits in **dlibgit**.
- You could pass an absolute path, e.g. `C:/some/git/repo/.git`

Another sample:

    $ rdmd build.d samples/showindex/showindex.d
    $ bin\showindex.exe .git

Some libgit functions work with either form of slashes on win32, but you should prefer using forward slashes.

## Usage tips
As a convenience you can import `git2.all` or `git2._` to import all modules at once.

## Documentation

The D bindings aren't documented, but they're 1-to-1 equivalents of the C libgit2 library.

You can use the libgit2 [Guide] and its [API] docs.

[API]: http://libgit2.github.com/libgit2/#HEAD
[Guide]: http://libgit2.github.com/api.html

## Note
- The shared lib is built from commit `acd1700630ea1159a55dc5e8cee12e4a725afe18` in the [development] branch. Inline functions were re-created in D because they're not exported. Do not try to use a shared lib built from other commits without doing a diff and verifying that the inline functions are still the same in the D version as in C. The libgit2 master branch is out of date and might not compile.
    
- x64 support will be added later. It might already work but some int types are hardcoded due to how gccxml exports typeinfo. size_t and friends will have to be fixed to guarantee safe behavior.
    
These bindings were autogenerated by **dgen**, with minor edits required due to missing inlined functions. dgen is a work in progress, and is not yet released.

[development]: https://github.com/libgit2/libgit2/tree/development

## See also
The libgit2 [homepage] and [github] repository.

[homepage]: http://libgit2.github.com/
[github]: https://github.com/libgit2/libgit2/

## License
See libgit's [COPYING] file, included in this repo. Also see the licensing remarks on the [libgit2] github page. I am not a lawyer.

[libgit2]: https://github.com/libgit2/libgit2/
[COPYING]: https://github.com/AndrejMitrovic/dlibgit/blob/master/COPYING

## DISCLAIMER

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
