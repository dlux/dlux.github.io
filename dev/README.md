# steps to develop this site

1. spin up ubuntu vagrant vm.
2. Installing jekyll and its dependencies

   ```
     # echo Vagrantfile
     # echo jekyll_setup.sh
     vagrant up
     vagrant ssh
   ```

2. clone this repo
3. create initial jekyll structure

   ```
     git clone https://github.com/dlux/dlux.github.io.git
     cd dlux.github.io/
     jekyll new --skip-bundle . --force
   ```

   ![tree](./static/img1.jpg?raw=true "initial structure")

4. prepare for github pages
   1. comment line 'gem "jekyll"' from Gemfile to use GitHub Pages
   2. add github-pages gem
   3. run bundle install

   ```
     sed -i 's/^gem "jekyll"/# gem "jekyll"/g' Gemfile
     sed -i '/^# gem "github-pages/a gem "github-pages", "~> 228", group: :jekyll_plugins' Gemfile
     bundle install
   ```

   ![tree](./static/img2.jpg?raw=true "build output")

5. make any necessary edits to the \_config.yml
6. test site locally

   ```
     tmux
     gem install github-pages
     #jekyll build
     # jekill serve
     #bundle exec jekyll serve
   ```

## References


[Creating github pages site with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll)
[jekyll docker images](https://github.com/envygeeks/jekyll-docker/blob/master/README.md)
[add jekyll theme](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/adding-a-theme-to-your-github-pages-site-using-jekyll)

