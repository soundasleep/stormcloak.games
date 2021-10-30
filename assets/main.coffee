---
# Only the main .coffee file needs front matter (the dashes are enough)

# We can't use require() on GitHub pages because we can't run browserify (plugin whitelist):
#   https://github.com/github/pages-gem/blob/bd1018072aab370ddf63aa9c3938867e2133ac80/lib/github-pages/configuration.rb#L15
# Alternatively we can set up an entirely new build system (e.g. https://github.com/unframework/browserify-github-pages)
# that builds on travis-ci, and then pushes the built JS.
#
# This also means we can't have minification for coffeescript. https://github.com/jekyll/jekyll-coffeescript/issues/5
---

# $(document).ready () ->
#   alert 'hello world!'
