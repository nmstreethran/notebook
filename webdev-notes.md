# Web development notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [HTML / CSS](#html--css)
  - [Colours](#colours)
  - [Selectors reference](#selectors-reference)
  - [Render whitespace when using `content`](#render-whitespace-when-using-content)
  - [Overflow](#overflow)
  - [Selecting elements](#selecting-elements)
  - [Fonts](#fonts)
  - [Responsive tables](#responsive-tables)
  - [Prevent overlap of content on navigation bar](#prevent-overlap-of-content-on-navigation-bar)
  - [Types of CSS](#types-of-css)
  - [Scale image height to match text height](#scale-image-height-to-match-text-height)
- [Issues](#issues)
  - [MIME type mismatch](#mime-type-mismatch)
- [Ruby](#ruby)
  - [Installing Ruby](#installing-ruby)
  - [Installing gems](#installing-gems)
  - [Installing gems with Bundler](#installing-gems-with-bundler)
  - [Caching Bundler gems with GitLab CI](#caching-bundler-gems-with-gitlab-ci)
  - [List installed gems](#list-installed-gems)
  - [Uninstalling old gem versions](#uninstalling-old-gem-versions)
  - [Cross-platform Gemfile](#cross-platform-gemfile)
  - [Fixing dependency errors](#fixing-dependency-errors)
  - [Update RubyGems manually](#update-rubygems-manually)
- [Jekyll](#jekyll)
  - [Local server](#local-server)
  - [GitHub Pages](#github-pages)
  - [Minimal Mistakes](#minimal-mistakes)
- [Sources](#sources)
- [See also](#see-also)

## HTML / CSS

### Colours

References:

- [HTML colour codes](https://htmlcolorcodes.com/)
- [Percent colour codes](https://www.december.com/html/spec/colorper.html)
- [Mozilla colour picker tool](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Colors/Color_picker_tool)

### Selectors reference

See <https://www.w3schools.com/cssref/css_selectors.asp>.

### [Render whitespace when using `content`](https://stackoverflow.com/a/40963855/4573584)

Set `white-space` to `pre` or `pre-wrap`, e.g.:

```css
h2.space::after {
  content: " ";
  white-space: pre;
}
```

### Overflow

[Prevent unbreakable strings from overflowing its line box (e.g. long URLs and words)](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-wrap):

```css
div {
  overflow-wrap: anywhere;
}
```

### Selecting elements

[Style the element with `id="firstname"`](https://www.w3schools.com/csSref/sel_id.asp):

```css
#firstname {
  background-color: yellow;
}
```

[Selecting elements with matching conditions](https://stackoverflow.com/a/56043821/4573584):

Given the following example snippet with a `div`:

```html
<div id='element_123_wrapper_text'>My sample DIV</div>
```

... to match IDs that starts with given value, use the operator `^`:

```css
div[id^="element_123"] {
  background-color: yellow;
}
```

... to match elements that ends with given value, use the operator `$`:

```css
div[id$="wrapper_text"] {
  background-color: yellow;
}
```

... to match elements that have an attribute containing a given value, use the operator `*`:

```css
div[id*="wrapper_text"] {
  background-color: yellow;
}
```

### Fonts

- [System fonts](https://devhints.io/css-system-font-stack)

### [Responsive tables](https://www.w3schools.com/howto/howto_css_table_responsive.asp)

> display a horizontal scroll bar if the screen is too small to display the full content

```html
<div style="overflow-x:auto;">
  <table>
      ...
  </table>
</div>
```

### [Prevent overlap of content on navigation bar](https://stackoverflow.com/a/16873252/4573584)

Adding a z-index to keep the navigation bar on top of everything. 999 is the max value.

```css
nav {
  z-index: 999;
}
```

### [Types of CSS](https://stackoverflow.com/a/40690406/4573584)

Inline CSS (within HTML):

```html
<div style="width:50px;height:50px;background color:red">
```

Internal CSS (within HTML):

```html
<head>
  <style>
    div {
      height: 50px;
      width: 50px;
      background-color: red;
      foreground-color: white;
    }
  </style>
</head>
<body>
  <div></div>
</body>
```

External CSS:

```html
<head>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <div></div>
</body>
```

... where `style.css` is:

```css
div {
  height: 50px;
  width: 50px;
  background-color: red;
}
```

### Scale image height to match text height

```css
img {
  height: 1em;
}
```

## Issues

### [MIME type mismatch](https://stackoverflow.com/q/40728554/4573584)

Could be caused by incorrect file path, e.g. missing leading slash.

```html
<link rel="stylesheet" type="text/css" href="/_static/custom.css">
```

#### [Check if Jekyll installed properly](https://jekyllrb.com/docs/installation/windows/)

```sh
jekyll -v
```

## Ruby

### Installing Ruby

First, check if Ruby is already installed and its version:

```sh
ruby --version
```

Download and install Ruby using instructions from the [official website](https://www.ruby-lang.org/en/).

- Use [RubyInstaller](https://rubyinstaller.org/) on Windows
- Use apt on Debian/Ubuntu (*may not be the latest version*):

  ```sh
  sudo apt-get install ruby-full
  ```

### Installing gems

Check the RubyGems environment:

```sh
gem environment
```

On Linux, install RubyGems locally, not using `sudo`. Installing using `sudo` can interfere with the system-wide installation and configurations.

```sh
gem install --user-install <gemname>
```

Add the user install directory to the `PATH` environment variable. Alternatively, change the `GEM_HOME` and `GEM_PATH` variables so that gems can be installed without `sudo` or `--user-install`, by adding the following to `~/.bash_profile` (or equivalent file):

```sh
export GEM_HOME=$HOME/.gem
export GEM_PATH=$GEM_HOME
export PATH="$GEM_PATH/bin:$PATH"
```

### Installing gems with Bundler

To install gems from a Gemfile, install [Bundler](https://bundler.io):

```sh
gem install bundler
```

Bundler installs gems in the same path as `gem install`.

To globally set Bundler to install gems in a custom path:

```sh
bundle config set path <path>
```

Install gems using Bundler:

```sh
bundle install
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

To check if there are any older versions of gems installed:

```sh
gem cleanup --dryrun
```

To uninstall them, omit `--dryrun` from the command.

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

The following dependency errors can occur if gems are installed using `sudo`:

```txt
An error occurred while installing eventmachine (1.2.7), and Bundler cannot continue.
Make sure that `gem install eventmachine -v '1.2.7' --source 'https://rubygems.org/'` succeeds before
bundling.
```

```txt
[...]
package configuration for openssl is not found
```

```txt
*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of
necessary libraries and/or headers.  Check the mkmf.log file for more
details.  You may need configuration options.
```

To fix this, either uninstall all `sudo` gems and reinstall them locally, or do the following:

```sh
sudo apt-get install ruby-full ruby-eventmachine
gem install bundler eventmachine
bundle install
```

### [Update RubyGems manually](https://github.com/jekyll/jekyll/issues/7463)

[Don't use this if Ruby is installed using a package manager](https://github.com/rubygems/rubygems/issues/3831), as it will handle updates automatically.

```sh
gem update --system
```

## Jekyll

### Local server

```sh
bundle exec jekyll serve
```

View the site at `http://localhost:4000/`.

### [GitHub Pages](https://pages.github.com/)

- [GitHub Pages Basics](https://docs.github.com/en/github/working-with-github-pages/getting-started-with-github-pages)
- [Using Jekyll as a static site generator with GitHub Pages](https://docs.github.com/en/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll)
- [Setting up your GitHub Pages site locally with Jekyll](https://docs.github.com/en/github/working-with-github-pages/testing-your-github-pages-site-locally-with-jekyll)

### [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/)

See <https://nithiya.gitlab.io/post/pages-tweaks/> for my personal modifications to this theme.

- [Installation](https://mmistakes.github.io/minimal-mistakes/docs/installation/)
- [Jekyll Remote Theme](https://github.com/benbalter/jekyll-remote-theme)
- [AcademicPages](https://github.com/academicpages/academicpages.github.io)
- [Adding favicons to website](https://github.com/mmistakes/minimal-mistakes/issues/949): use [Favicon generator](https://realfavicongenerator.net/) to generate the icons and HTML, then drop them into `/assets/icons/` and `/_includes/head/custom.html` respectively. Make sure you update the path to the icons in the HTML file.

#### Social share buttons

Edit `_includes/social-share.html` to add or remove buttons.

Buttons' colours can be changed in `_sass/minimal-mistakes/_buttons.scss`, under `$buttoncolors:`:

```html
(reddit, #ff4500)
```

## Sources

- <https://stackoverflow.com/q/2119064/4573584>
- <https://unix.stackexchange.com/a/210012/287341>
- <https://bundler.io/v2.2/man/bundle-install.1.html>
- <https://bundler.io/v2.2/man/bundle-config.1.html>
- <https://gitlab.com/gitlab-org/gitlab/-/blob/master/lib/gitlab/ci/templates/Ruby.gitlab-ci.yml>
- <https://docs.gitlab.com/ee/development/cicd/templates.html>
- <https://www.heatware.net/ruby-rails/solved-installing-mysql-gem-extconf-rb-failed-error/>
- <https://github.com/tzinfo/tzinfo/wiki/Resolving-TZInfo::DataSourceNotFound-Errors>
- <https://stackoverflow.com/a/8460294/4573584>
- <https://bundler.io/v2.2/man/gemfile.5.html#PLATFORMS>

## See also

1. [Top Ten Static Site Generators of 2017](https://www.netlify.com/blog/2017/05/25/top-ten-static-site-generators-of-2017/)
2. [Jekyll on Windows](https://jekyllrb.com/docs/installation/windows/)
3. [Jekyll documentation](https://jekyllrb.com/docs/)
