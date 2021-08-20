# Web browsing <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Firefox](#firefox)
  - [Find location of extensions](#find-location-of-extensions)
  - [View and modify extension data](#view-and-modify-extension-data)
  - [Crashes](#crashes)
- [uBlock Origin](#ublock-origin)
  - [Search result blocking](#search-result-blocking)

## Firefox

### [Find location of extensions](https://stackoverflow.com/a/6579979)

Type `about:support#extensions-tbody` in search

### [View and modify extension data](https://github.com/mozilla/multi-account-containers/issues/1661#issuecomment-591506621)

Go to `about:debugging#/runtime/this-firefox` to open the extension console

### Crashes

View and submit crash reports via `about:crashes`.

## uBlock Origin

### Search result blocking

To block certain search and image search results from showing up, use the following filters:

```text
! DuckDuckGo
duckduckgo.com##.result[data-domain$="thesun.co.uk"]
! Ecosia
ecosia.*##.g:has(a[href*="thesun.co.uk"])
ecosia.*##a[href*="thesun.co.uk"]:nth-ancestor(1)
! Google
google.*##.g:has(a[href*="thesun.co.uk"])
google.*##a[href*="thesun.co.uk"]:nth-ancestor(1)
```

Source: [Reddit posts](https://www.reddit.com/r/uBlockOrigin/comments/mml29s/removing_items_from_duckduckgo_search_results/) by u/leedaa99 and u/DrTomDice.

The example above works for `thesun.co.uk`. To block multiple domains, create a text file (e.g. `list.txt`) and list each domain in a new line. Then, the following `awk` commands can be used to generate the filters for each search engine:

```sh
#!/bin/sh

# DuckDuckGo
awk '{
    se="duckduckgo.com##.result[data-domain$=\""$1"\"]";
    print se
}' uBlockOriginSearchBlock.txt > uBlockOriginDDGBlock.txt

# Ecosia
awk '{
    se="ecosia.*##.g:has(a[href*=\""$1"\"])\necosia.*##a[href*=\""$1"\"]:nth-ancestor(1)";
    print se
}' uBlockOriginSearchBlock.txt > uBlockOriginEcosiaBlock.txt

# Google
awk '{
    se="google.*##.g:has(a[href*=\""$1"\"])\ngoogle.*##a[href*=\""$1"\"]:nth-ancestor(1)";
    print se
}' uBlockOriginSearchBlock.txt > uBlockOriginGoogleBlock.txt
```

The results will be saved in new text files (i.e. `ddg.txt`, `ecosia.txt`, and `google.txt`). Simply copy and paste the contents of these text files in your uBlock Origin personal filter list, or store them in a GitHub Gist and import them into uBlock Origin using their raw file URL. The Gist's URL is of the following form:

```text
https://gist.github.com/${username}/${gistid}/raw/${filename}
```
