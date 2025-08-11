# dlux.github.io

personal blog




## Manual build

- Assume linux host with podman installed

```
 podman image pull jekyll/jekyll
 podman run --rm -e JEKYLL_ROOTLESS=1 \
   -v $(pwd):/srv/jekyll \
   -it jekyll/jekyll \
   sh -c "chown -R jekyll /usr/gem/ && jekyll new --skip-bundle . --force "
```

## Interactive Development
```

podman run -it -e JEKYLL_ROOTLESS=1  -v $(pwd):/srv/jekyll  jekyll/jekyll   -- /bin/bash
  >$$ chown -R jekyll /usr/gem/ &&  bundle update && bundle install
  >$$ jekyll serve --trace
```

## Development

For local development, Jekyll can be run in server mode inside the container. It will watch for changes, rebuild the site, and provide access through its included web server. Check results by reloading http://localhost:4000/ in a browser.

```
 podman run --rm -e JEKYLL_ROOTLESS=1 \
   -v $(pwd):/srv/jekyll \
   --publish [::1]:4000:4000 \
   -it jekyll/jekyll \
   sh -c "chown -R jekyll /usr/gem/ &&  bundle install &&  jekyll serve --trace"
```
