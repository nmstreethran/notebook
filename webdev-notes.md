# Web development notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [GitHub Pages](#github-pages)
- [Minimal Mistakes](#minimal-mistakes)
- [Local](#local)
- [System](#system)
- [See also](#see-also)

## [GitHub Pages](https://pages.github.com/)

* [GitHub Pages Basics](https://help.github.com/en/categories/github-pages-basics)
* [Using Jekyll as a static site generator with GitHub Pages](https://help.github.com/en/articles/using-jekyll-as-a-static-site-generator-with-github-pages)
* [Setting up your GitHub Pages site locally with Jekyll](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll)
* [Jekyll Windows installation](https://jekyllrb.com/docs/installation/windows/)
* [Jekyll documentation](https://jekyllrb.com/docs/)

## [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/)

* [Installation](https://mmistakes.github.io/minimal-mistakes/docs/installation/)
* [Jekyll Remote Theme](https://github.com/benbalter/jekyll-remote-theme)
* [Adding favicons to website](https://github.com/mmistakes/minimal-mistakes/issues/949): use [Favicon generator](https://realfavicongenerator.net/) to generate the icons and HTML, then drop them into `/assets/icons/` and `/_includes/head/custom.html` respectively. Make sure you update the path to the icons in the HTML file.

### Social share buttons <!-- omit in toc -->

Edit `_includes/social-share.html` to add or remove buttons:

```html
<a href="https://www.reddit.com/submit?url={{ page.url | absolute_url | url_encode }}&title={{ page.title }}" class="btn btn--reddit" title="{{ site.data.ui-text[site.locale].share_on_label }} Reddit"><i class="fab fa-fw fa-reddit" aria-hidden="true"></i><span> Reddit</span></a>
```

Buttons' colours can be changed in `_sass/minimal-mistakes/_buttons.scss`, under `$buttoncolors:`:

```html
(reddit, #ff4500)
```

## Local

Check files in local repository:

```bash
ls
```

Installing gems added to gemfile:

```bash
bundle install
```

Running Jekyll site locally:

```bash
bundle exec jekyll serve
```

Updating the site:

```bash
bundle update 
```

[Resolving TZInfo::DataSourceNotFound Errors](https://github.com/tzinfo/tzinfo/wiki/Resolving-TZInfo::DataSourceNotFound-Errors) by adding this to the Gemfile:

```ruby
gem 'tzinfo-data'
```

## System

Check Ruby version:

```bash
ruby --version
```

Install Bundler:

```bash
gem install bundler
```

[Update Rubygems](https://github.com/jekyll/jekyll/issues/7463):

```bash
gem update --system
```

## See also

1. [Top Ten Static Site Generators of 2017](https://www.netlify.com/blog/2017/05/25/top-ten-static-site-generators-of-2017/)