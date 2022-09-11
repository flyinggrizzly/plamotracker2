# plamotracker2

An app for tracking plastic models.

## Setup

1. Install Ruby > 3.1.1 (I recommend [chruby](https://github.com/postmodern/chruby) or [rbenv](https://github.com/rbenv/rbenv))
2. Install sqlite3
3. Install deps `% bundle install`
4. Prep database `% bin/rails db:create db:migrate`
5. Optionally set up fact table seeds in database for things like `KitLine` (e.g. HGUC, MG, Volks' IMS) and
   `SourceMaterial` (things like `'gundam', 'gundam/zeta', 'mak'`) with `% bin/rails db:seed`
6. Run the server and hit the web interface:
  - `bin/rails server`
  - Usually `http://localhost:3000`

## Philosophy

My intent is for installations to be disposable, but the data to be recoverable. In my case, that means I will be
periodically writing my database out to some kind of persistable format, and pushing to Github, so I don't have to pay
for persistent storage, and I'm also not at risk of accidentally losing things off my computer.

To this end, all records need to have some kind of stable UUID that is independent of the database ID. In the case of
`SourceMaterial`, it's the `slug`. For `Producer`, `Designer`, `Material` etc, it's just the name. `Kit` records are the
hardest here, since I'd like the UUID to be meaningful to a human, but still unique. Kits have very few uniqueness
constraints, so their `identifier` cosntructs itself from lots of collaborating object data. For a kit, this makes
sense, because it is only unique within the scope of producers, designers, lines, and scale.

## Running tests

`% bin/rspec`
