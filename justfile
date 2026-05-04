set shell := ["fish", "-c"]
set script-interpreter := ["fish"]
set unstable := true

SRC := ```find -name '*.c'```
CFLAGS := "-O2 -std=c23 -fPIC"
NAME := "libErr"
HNAME := "Err"

install: lib so && clean
    sudo install -m 755 -o root {{ NAME }}.so /usr/local/lib/
    sudo install -m 644 -o root {{ NAME }}.a /usr/local/lib/
    sudo install -d /usr/local/include/havok
    sudo install -D -m 644 -o root (find -name '*.h') /usr/local/include/havok
    sudo install -m 644 -o root {{ HNAME }}.pc /usr/local/lib/pkgconfig/

obj:
    clang {{ CFLAGS }} -c {{ SRC }}

lib: obj
    ar rcs {{ NAME }}.a (find -name '*.o')

so: obj
    clang {{ CFLAGS }} (find -name '*.o') -shared -o {{ NAME }}.so

clean:
    find -name '*.o' -delete
