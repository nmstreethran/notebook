# Web development notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [GitHub Pages](#github-pages)
- [See also](#see-also)
- [Archive - Minimal Mistakes](#archive---minimal-mistakes)

## [GitHub Pages](https://pages.github.com/)

* [GitHub Pages Basics](https://help.github.com/en/categories/github-pages-basics)
* [Using Jekyll as a static site generator with GitHub Pages](https://help.github.com/en/articles/using-jekyll-as-a-static-site-generator-with-github-pages)
* [Setting up your GitHub Pages site locally with Jekyll](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll)

https://jekyllrb.com/docs/

https://jekyllrb.com/docs/installation/windows/

## See also

* [Top Ten Static Site Generators of 2017](https://www.netlify.com/blog/2017/05/25/top-ten-static-site-generators-of-2017/)
* [Minimal Mistakes theme](https://mmistakes.github.io/minimal-mistakes/)

## Archive - Minimal Mistakes

* [Adding favicons to website](https://github.com/mmistakes/minimal-mistakes/issues/949): use [Favicon generator](https://realfavicongenerator.net/) to generate the icons and HTML, then drop them into `/_includes/head/` and `/_includes/head/custom.html` respectively.

### Social share buttons <!-- omit in toc -->

Edit `_includes/social-share.html` to add or remove buttons:

```html
<a href="https://www.reddit.com/submit?url={{ page.url | absolute_url | url_encode }}&title={{ page.title }}" class="btn btn--reddit" title="{{ site.data.ui-text[site.locale].share_on_label }} Reddit"><i class="fab fa-fw fa-reddit" aria-hidden="true"></i><span> Reddit</span></a>
```

Buttons' colours can be changed in `_sass/minimal-mistakes/_buttons.scss`, under `$buttoncolors:`:

```html
(reddit, #ff4500)
```