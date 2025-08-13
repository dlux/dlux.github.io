# dlux.github.io

[![Build and Deploy](https://github.com/dlux/dlux.github.io/actions/workflows/pages-deploy.yml/badge.svg?branch=main)][ci]&nbsp;
[![GitHub license](https://img.shields.io/github/license/saltstack/salt?color=goldenrod)][license]&nbsp;

## Overview

Personal blog built with Jekyll using the Chirpy theme.

- [**dlux.github.io**](https://dlux.github.io/)

## Theme Source

Chirpy:

- [GitHub](https://github.com/cotes2020/jekyll-theme-chirpy)
- [Example and tips/best practices](https://chirpy.cotes.page/)
- **NOTE: Pull git submodules**

## Building/ Testing Locally

For local development, Jekyll can be run in server mode inside the container. It will watch for changes, rebuild the site, and provide access through its included web server. Check results by reloading http://localhost:4000/ in a browser.

Assume linux host with podman installed:

```
  podman image pull jekyll/jekyll

  # Build the site
  podman run --rm -e JEKYLL_ROOTLESS=1 \
      -v $(pwd):/srv/jekyll \
      jekyll/jekyll \
      sh -c "chown -R jekyll /usr/gem/ &&  bundle install"

  # Serve the site locally (port 4000)
  podman run --rm -e JEKYLL_ROOTLESS=1 \
      -v $(pwd):/srv/jekyll \
      --publish 4000:4000 \
      jekyll/jekyll \
      sh -c "chown -R jekyll /usr/gem/ &&  jekyll serve --trace"


  # Interact with jekyll, extra debug (port 4010)
  podman run -it -e JEKYLL_ROOTLESS=1 \
      -v $(pwd):/srv/jekyll \
      --publish 4010:4000 \
      jekyll/jekyll -- /bin/bash

    # On the container
    >$ chown -R jekyll /usr/gem/
    >$ bundle
    >$ # bundle install
    >$ # bundle update
    >$ # jekyll build --destination "public"
    >$ jekyll serve --host 0.0.0.0 --trace
```

[ci]: https://github.com/dlux/dlux.github.io/actions/workflows/pages-deploy.yml
[license]: https://github.com/dlux/dlux.github.io/blob/master/LICENSE
