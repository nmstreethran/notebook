## HTML / CSS

### Colours

References:

- [HTML colour codes](https://htmlcolorcodes.com/)
- [Percent colour codes](https://johndecember.com/html/spec/colorper.html)
- [Mozilla colour picker tool](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Colors/Color_picker_tool)

### [Render whitespace when using `content`](https://stackoverflow.com/a/40963855)

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

### [Selecting elements with matching conditions](https://stackoverflow.com/a/56043821)

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

### [Prevent overlap of content on navigation bar](https://stackoverflow.com/a/16873252)

Adding a z-index to keep the navigation bar on top of everything. 999 is the max value.

```css
nav {
  z-index: 999;
}
```

### [Types of CSS](https://stackoverflow.com/a/40690406)

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

### [MIME type mismatch](https://stackoverflow.com/q/40728554)

Could be caused by incorrect file path, e.g. missing leading slash.

```html
<link rel="stylesheet" type="text/css" href="/_static/custom.css">
```

## [Minimal Mistakes theme](https://mmistakes.github.io/minimal-mistakes/)

See <https://nithiya.gitlab.io/post/pages-tweaks/> for my personal modifications to this theme.

- [AcademicPages](https://github.com/academicpages/academicpages.github.io)
- [Adding favicons to website](https://github.com/mmistakes/minimal-mistakes/issues/949): use [Favicon generator](https://realfavicongenerator.net/) to generate the icons and HTML, then drop them into `/assets/icons/` and `/_includes/head/custom.html` respectively. Make sure you update the path to the icons in the HTML file.

### Social share buttons

Edit `_includes/social-share.html` to add or remove buttons.

Buttons' colours can be changed in `_sass/minimal-mistakes/_buttons.scss`, under `$buttoncolors:`:

```html
(reddit, #ff4500)
```

## See also

- [Top Ten Static Site Generators of 2017](https://www.netlify.com/blog/2017/05/25/top-ten-static-site-generators-of-2017/)
