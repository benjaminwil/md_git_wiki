# Markdown-Git Wiki

This gem creates a wiki out of any git repository that has directories with
Markdown files inside.  It primarily does this by adding a table of contents to
the end of each directory's `README.md` file.  It was inspired by [Artsy
Engineering's README][1] repository.

In order to make a functional wiki, then, this gem requires some opinionated
file formatting:

  - Each subdirectory contains a `README.md` file.
  - Each content file contains YAML frontmatter with `title` and `description`
    fields.
  - The parent directory contains a YAML file with `title`s and `description`s
    for each subdirectory (or *section*) of the wiki.

[1]: https://github.com/artsy/README

## Example structure

The following block should make the required directory structure more clear:

    my_wiki
    │
    ├── README.md
    ├── my_wiki.yml
    ├── section-one
    │     ├── README.md
    │     ├── frequently-asked-questions.md
    │     ├── prerequisites.md
    │     └── setup.md
    └── section-two
          ├── README.md
          ├── emergency-contacts.md
          └── how-to-drive-the-bulldozer.md

This gem only modifies the `README.md` files. I recommend that you keep them
short so that the tables of contents aren't "hidden" at the bottom of each
file.

When generated, a table of contents should look like this:

    |----------------------------------|-----------------------------------------------------------------|
    | **Title**                        | **Description**                                                 |
    |----------------------------------|-----------------------------------------------------------------|
    | [Frequently asked questions][a3] | Questions and answers that help you assess Section One.         |
    | [Prerequisites][4r]              | A list of software you require before starting setup.           |
    | [Setup][fo]                      | The setup procedure, including optional configuration settings. |
    |----------------------------------|-----------------------------------------------------------------|

    [a3]: frequently-asked-questions.md
    [4r]: prerequisites.md
    [fo]: setup.md

Note the reference-style links, and how they ensure the table of contents is
still readable in plain text.

## Usage

WIP

