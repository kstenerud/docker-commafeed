Commafeed Dockerfile
====================

A basic dockerfile that uses a pre-built jarfile instead of installing 600mb of dev tools just to build from source. What we really need is a temporary docker "dev" image for the compilation phase, which gets thrown out once the artifacts are built and copied to the final docker image...

All configuration and data is stored host-side via volume bind mount.

Current Commafeed version: 2.0.3

Usage
-----
    docker build -t kstenerud/commafeed .
    docker run -d -p 8083:8083 -v /path/to/host-side/data/dir:/var/lib/commafeed/data kstenerud/commafeed

Commafeed will expect to find config.yml in the data dir, and will also store commafeed.mv.db there.
There's a basic config.yml in host-files that you can copy.

License
-------
The MIT License (MIT)

Copyright (c) 2014 Karl Stenerud

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
