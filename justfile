set shell := ["fish", "-c"]
set script-interpreter := ["fish"]
set unstable := true

SRC := ```find -name '*.c'```
CFLAGS := "-O2 -std=c23 -fPIC"
NAME := "libHavok"
HNAME := "Havok"

install: lib so && clean
    sudo install -m 755 -o root {{ NAME }}.so /usr/local/lib/
    sudo install -m 644 -o root {{ NAME }}.a /usr/local/lib/
    sudo install -d /usr/local/include/{{ HNAME }}
    sudo install -D -m 644 -o root (find -name '*.h') /usr/local/include/{{ HNAME }}
    sudo install -m 644 -o root {{ HNAME }}.pc /usr/local/lib/pkgconfig/

uninstall:
    sudo rm /usr/local/lib/{{ NAME }}.so
    sudo rm /usr/local/lib/{{ NAME }}.a
    sudo rm -rdf /usr/local/include/{{ HNAME }}
    sudo rm /usr/local/lib/pkgconfig/{{ HNAME }}.pc

obj:
    clang {{ CFLAGS }} -c {{ SRC }}

lib: obj
    ar rcs {{ NAME }}.a (find -name '*.o')

so: obj
    clang {{ CFLAGS }} (find -name '*.o') -shared -o {{ NAME }}.so

clean:
    find -name '*.o' -delete
