stormcloak.games
================

Source code for https://stormcloak.games in [Jekyll](https://jekyllrb.com/).

* Using [Minima theme](https://github.com/jekyll/minima)
* [Jekyll layout cheat sheet](https://devhints.io/jekyll)

## Running locally

```
bundle install
bundle exec jekyll serve --livereload --incremental
```

And then visit http://localhost:4000.

## Developing

If hosted on GitHub pages, you can't import anything from `node_modules`, so there's no point in having
a `package.json` (unless you compile `bundle.{js,css}` first on travis-ci etc).
