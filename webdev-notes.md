# Web development notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [HTML / CSS](#html--css)
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
- [Jekyll](#jekyll)
  - [GitHub Pages](#github-pages)
  - [Minimal Mistakes](#minimal-mistakes)
  - [Local](#local)
  - [System](#system)
  - [See also](#see-also)

## HTML / CSS

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

[Prevent unbreakable strings from overflowing its line box (e.g., long URLs and words)](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-wrap):

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

Could be caused by incorrect file path, e.g., missing leading slash.

```html
<link rel="stylesheet" type="text/css" href="/_static/custom.css">
```

## Jekyll

### [GitHub Pages](https://pages.github.com/)

- [GitHub Pages Basics](https://docs.github.com/en/github/working-with-github-pages/getting-started-with-github-pages)
- [Using Jekyll as a static site generator with GitHub Pages](https://docs.github.com/en/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll)
- [Setting up your GitHub Pages site locally with Jekyll](https://docs.github.com/en/github/working-with-github-pages/testing-your-github-pages-site-locally-with-jekyll)

### [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/)

See <https://nithiya.gitlab.io/development/pages-tweaks/> for my personal modifications to this theme.

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

### Local

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

### System

Check Ruby version:

```bash
ruby --version
```

[Install Jekyll and Bundler (after installing Ruby and the PATH environment variable becomes effective)](https://jekyllrb.com/docs/installation/windows/):

```ruby
gem install jekyll bundler
```

[Check if Jekyll installed properly](https://jekyllrb.com/docs/installation/windows/):

```bash
jekyll -v
```

[Update Rubygems](https://github.com/jekyll/jekyll/issues/7463):

```bash
gem update --system
```

### See also

1. [Top Ten Static Site Generators of 2017](https://www.netlify.com/blog/2017/05/25/top-ten-static-site-generators-of-2017/)
2. [Jekyll on Windows](https://jekyllrb.com/docs/installation/windows/)
3. [Jekyll documentation](https://jekyllrb.com/docs/)
