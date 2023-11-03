cheatsheet do
  title 'Firefox'               # Will be displayed by Dash in the docset list
  docset_file_name 'Firefox'    # Used for the filename of the docset
  keyword 'Firefox'             # Used as the initial search keyword (listed in Preferences > Docsets)
  # resources 'resources_dir'  # An optional resources folder which can contain images or anything else

  introduction 'Firefox Navigation Cheatsheet'  # Optional, can contain Markdown or HTML

  # A cheat sheet must consist of categories
  category do
    id 'Quantumbar Shortcuts'  # Must be unique and is used as title of the category

    entry do
      command '^'         # Optional
      name 'Filter on browsing history'    # A short name, can contain Markdown or HTML
      notes 'Start typing your search with ^ to show only matches in your browsing history'      # Optional longer explanation, can contain Markdown or HTML
    end
    entry do
      command '*'
      name 'Filter on bookmarks'    # A short name, can contain Markdown or HTML
    end
    entry do
      command '+'
      name 'Filter on tagged bookmarks'
    end
    entry do
      command '%'
      name 'Filter on currently open tabs'
    end
    entry do
      command '#'
      name 'Filter matches on title or tag'
    end
    entry do
      command '$'
      name 'Filter on search terms that are part of a web address'
      notes 'The text “https://” or “http://” in the URL is ignored but not “file:///”.'
    end
    entry do
      command '?'
      name 'Show only search suggestions'
    end
    entry do
      command 'CTRL-Enter'
      name 'Works like autocomplete'
      notes 'Ex. mozilla will go straight ot www.mozilla.com'
    end
    entry do
      command 'Shift-Enter'
      name 'Open URL in new tab'
    end
  end

  category do
    id 'Small navigation tricks'

    entry do
      command 'Hold down Alt on text selection'
      name 'Select text without triggering any links'
    end

    entry do
      command 'Shift-Right Click'
      name 'Show Firefox context menu, even if overridden'
    end
  end

  notes 'Sourced from https://exple.tive.org/blarg/2020/10/25/navigational-instruments/'
end
