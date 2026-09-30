# Schwuk's Blog

This is the [Jekyll](https://jekyllrb.com/)-powered site for my [personal blog](https://blog.schwuk.com).

The website is hosted using [GitHub Pages](http://pages.github.com/).

## Setting up development environment

All the [Jekyll](https://jekyllrb.com/)/[Ruby](https://www.ruby-lang.org/en/) requirements can be managef through an Open Containers Initiative (OCI) Container. I'm using [Container](https://github.com/apple/container) from Apple.

### Prerequisites

Before you begin, ensure you system has:

- [Apple Container](https://github.com/apple/container)
- [Make](https://www.gnu.org/software/make/).
- A text editor.

Run `make init` to initialise the environment and install the dependencies.
## Modifying the content

Edit/add files as necessary. Since we're leveraging the power of Github pages and Jekyll, don't forget you can edit files directly through Github for instant satisfaction.

## Running the site locally

```bash
make serve
```

You can now access the site at http://localhost:4000.

## Updating dependencies

```bash
make update
```

Run `make help` to see the other targets available.
