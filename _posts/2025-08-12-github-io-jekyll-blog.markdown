---
layout: post
title:  "Creating github.io blog with Jekyll"
date:   2025-08-12 08:36:40 -0500
categories: jekyll update
---

<img src="/assets/2025/08/jekyll-01.png" alt="jekyll" style="width:40%;">
 
 Jekyll is a simple, blog-aware, static site generator with built-in support for GitHub Pages and a simplified build process.

 To publish github.io, pretty much follow steps 1 to 11 from [HERE](https://docs.github.com/en/pages/quickstart)

Then follow next steps to render it/ plug it with **JEKYLL**

## Steps

 1. Create blog structure with Jekyll

    ```
      # assume ubuntu linux and podman installed
      # assume non-root
      # apt update && apt-get install -y podman

      # get the image
      $ podman image pull jekyll/jekyll

      # create structure
      $ podman run --rm -e JEKYLL_ROOTLESS=1 -v $(pwd):/srv/jekyll \
        jekyll/jekyll  sh -c 'chown -R jekyll /usr/gem/ && jekyll new --skip-bundle . --force'
    ```

2. Update _config.yml to include your data
3. Update Gemfile:

    - comment line '# gem "jekyll" ...'
    - uncomment line 'gem "github-pages" ...'
    - add line 'gem "webrick"'
    - add plugin 'gem "webrick"'

4. Update about.markdown file with info about your blog
5. Update the content of your first post under _posts/ - Default one refers to Jekyll
6. Build and visualize your site locally

  ```
    # build and run webserver
    $ podman run --rm -e JEKYLL_ROOTLESS=1 -v $(pwd):/srv/jekyll \
     -p [::1]:4000:4000 jekyll/jekyll \
     sh -c "chown -R jekyll /usr/gem/ && bundle install && jekyll serve --trace"

    # open your browser
    https://localhost:4000
  ```

7. If having issues or want to keep running commands - then interact with the container

  ```
    # open interactive container
    $ podman run -it -e JEKYLL_ROOTLESS=1  -v $(pwd):/srv/jekyll  jekyll/jekyll   -- /bin/bash

    # run commands inside the container
    >097134> ls -la /usr/gem/
    >097134> chown -R jekyll /usr/gem/
    >097134> gem install webrick
    >097134> bundle install
    >097134> jekyll serve --trace
    ...
  ```

<br/><br/>
## Dedicated DEV environment

If you prefer to install jekyll and its dependencies on the linux system or a dedicated development vagrant vm (instead of using the containers)

  ```
  ## 1. Download my example for Vagrantfile and jekyll_setup.sh
    $ curl -LOk https://raw.githubusercontent.com/dlux/dlux.github.io/refs/heads/main/dev/Vagrantfile
    $ curl -LOk https://raw.githubusercontent.com/dlux/dlux.github.io/refs/heads/main/dev/jekyll_setup.sh

    # NOTE: update both files as needed (e.g. versions)
    $ cat Vagrantfile
    $ cat jekyll_setup.sh

  ## 2. Spin up ubuntu vm, setup.sh script will install jekyll and its dependencies
    $ vagrant up

    # Login to the running VM
    $ vagrant ssh

  ## 3. Create initial jekyll structure

    # clone project inside VM
    # e.g. git clone https://github.com/dlux/dlux.github.io.git
    # cd dlux.github.io/

    $ jekyll new --skip-bundle . --force
  ```

  ![tree](/assets/2025/08/img1.jpg?raw=true "initial structure")

  ```
  ## 4. follow the same steps as with podmain image:
  ### update files: _config.yml, Gemfile, about.markdown, _posts/2025...post1
    sed -i 's/^gem "jekyll"/# gem "jekyll"/g' Gemfile
    sed -i 's/^# gem "github-pages"/gem "github-pages"/g' Gemfile
    bundle install
    #gem install github-pages
    #jekyll build
    #bundle exec jekyll serve

    $ jekill serve
  ```

  ![tree](/assets/2025/08/img2.jpg?raw=true "build output")

<br/><br/>

## References

[Creating github pages site with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll)

[jekyll docker images](https://github.com/envygeeks/jekyll-docker/blob/master/README.md)

[add jekyll theme](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/adding-a-theme-to-your-github-pages-site-using-jekyll)
