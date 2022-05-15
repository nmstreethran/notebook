## Installing Ruby

First, check if Ruby is already installed and its version:

```sh
ruby --version
```

Download and install Ruby using instructions from the [official website](https://www.ruby-lang.org/en/).

- Use [RubyInstaller](https://rubyinstaller.org/) on Windows
- On Debian/Ubuntu (*may not be the latest version*):

  ```sh
  sudo apt install ruby-dev
  ```

- On Arch Linux:

  ```sh
  sudo pacman -Syu ruby  # latest version
  sudo pacman -Syu ruby2.7  # specific older version
  ```

## Installing gems

Check the RubyGems environment:

```sh
gem environment
```

On Linux, install RubyGems locally, not using `sudo`. Installing using `sudo` can interfere with the system-wide installation and configurations.

```sh
gem install --user-install ${gemname}
```

Add the user install directory to the `PATH` environment variable. Alternatively, change the `GEM_HOME` and `GEM_PATH` variables so that gems can be installed without `sudo` or `--user-install`, by adding the following to `~/.zshrc` (or equivalent):

```sh
export GEM_HOME=~/.gem
export GEM_PATH=$GEM_HOME/ruby/3.0.0
export PATH="$GEM_PATH/bin:$PATH"
```

To update the paths, run `source ~/.zshrc`.

### Installing gems with Bundler

To install gems from a Gemfile, install [Bundler](https://bundler.io):

```sh
gem install bundler
```

To install Bundler for a specific older version of Ruby (e.g. 2.7):

```sh
gem-2.7 install bundler
```

Bundler installs gems in the same path as `gem install`.

To globally set Bundler to install gems in a custom path:

```sh
bundle config set path ${path}
```

Install gems using Bundler:

```sh
bundle install
```

To use Bundler with a specific older version of Ruby:

```sh
bundle-2.7 install
```

### Caching Bundler gems with GitLab CI

```yml
job:
  image: ruby:latest
  variables:
    BUNDLE_PATH: .gem
  cache:
    key: bundler-cache
    paths:
      - $BUNDLE_PATH
  before_script:
    - bundle install
  script:
    # [...]
```

### List installed gems

To see the list of installed gems:

```sh
gem list
```

### Uninstalling old gem versions

To check if there are any older versions of gems installed, do a dry run of the clean up command:

```sh
gem cleanup --dryrun
```

If the [following error](https://stackoverflow.com/a/58798613) shows up:

```text
ERROR:  While executing gem ... (NameError)
    uninitialized constant Gem::RDoc
```

Install `rdoc`:

```sh
gem install rdoc
```

### Cross-platform Gemfile

If a project has both the Gemfile and Gemfile.lock checked in, and it is used cross-platform, and some dependencies only apply to a particular platform, specify them in the Gemfile like this...

```ruby
gem "execjs"
gem "therubyracer", :platforms => :ruby # only install in 'ruby' platform
```

Doing the above will ensure Gemfile.lock does not get regenerated every time.

The following is an example Gemfile for a Jekyll site, which requires two additional libraries on Windows:

```ruby
source "https://rubygems.org"

gem "minimal-mistakes-jekyll"

platforms :mswin, :mingw, :x64_mingw do
    gem "wdm", ">= 0.1.0"
    gem "tzinfo-data"
end
```

### Fixing dependency errors

The following dependency errors can occur (for example, with `eventmachine`):

```text
An error occurred while installing eventmachine (1.2.7), and Bundler cannot continue.
Make sure that `gem install eventmachine -v '1.2.7' --source 'https://rubygems.org/'` succeeds before
bundling.
```

```text
[...]
package configuration for openssl is not found
```

```text
*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of
necessary libraries and/or headers.  Check the mkmf.log file for more
details.  You may need configuration options.
```

To fix this, do the following (on Ubuntu):

```sh
sudo apt install ruby-dev make gcc g++ ruby-eventmachine libssl-dev
gem install bundler
bundle install
```

More info:

- <https://stackoverflow.com/q/13767725>
- <https://stackoverflow.com/q/3458602>

`'require': cannot load such file -- webrick` can be fixed by adding `gem "webrick"` to the Gemfile.

<https://stackoverflow.com/a/65621758>

This error indicates that Make is not installed:

```text
sh: line 1: make: command not found

make failed, exit code 127
```

Install on Arch Linux (not necessary if `base-devel` is installed):

```sh
sudo pacman -Syu make
```

## Ruby programming

Setting up a simple Ruby programme:

- create a text file named `hello.rb`
- paste `puts "Hello World!"` in the text file
- run the programme from the terminal: `ruby hello.rb`

Running a simple web-based Ruby application:

- install a web server framework: `gem install sinatra`
- create a text file named `wwwhello.rb`
- paste the following in the text file:

  ```rb
  get '/' do
    "Hello World!"
  end
  ```

- fix SSL issues (check links below)
- run the programme: `ruby wwwhello.rb`
- go to `https://localhost:4567/` to view the application

Links:

- <https://stackoverflow.com/a/2728204>
- <https://stackoverflow.com/a/20433632>
- <https://gist.github.com/hvasconcelos/9911439>
- <https://askubuntu.com/q/950815/714808>

## Jekyll

### Local server

```sh
bundle exec jekyll serve
```

View the site at `http://localhost:4000/`.

### [Check if Jekyll installed properly](https://jekyllrb.com/docs/installation/windows/)

```sh
jekyll -v
```

- [Jekyll on Windows](https://jekyllrb.com/docs/installation/windows/)
- [Jekyll documentation](https://jekyllrb.com/docs/)

### [GitHub Pages](https://pages.github.com/)

- [GitHub Pages Basics](https://docs.github.com/en/pages/getting-started-with-github-pages)
- [Using Jekyll as a static site generator with GitHub Pages](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll)
- [Setting up your GitHub Pages site locally with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)
- [Installation - Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/docs/installation/)
- [Jekyll Remote Theme](https://github.com/benbalter/jekyll-remote-theme)

## References

- <https://bundler.io/v2.2/man/bundle-install.1.html>
- <https://bundler.io/v2.2/man/bundle-config.1.html>
- <https://gitlab.com/gitlab-org/gitlab/-/blob/master/lib/gitlab/ci/templates/Ruby.gitlab-ci.yml>
- <https://www.heatware.net/ruby-rails/solved-installing-mysql-gem-extconf-rb-failed-error/>
- <https://github.com/tzinfo/tzinfo/wiki/Resolving-TZInfo::DataSourceNotFound-Errors>
- <https://bundler.io/v2.2/man/gemfile.5.html#PLATFORMS>
- [does using ":platforms =>" in your gemfile work?](https://stackoverflow.com/a/8460294)
- ['sudo gem install' or 'gem install' and gem locations](https://stackoverflow.com/q/2119064)
- [How to set Ruby GEM_HOME and GEM_PATH](https://unix.stackexchange.com/a/210012)
