# plamotracker2

An app for tracking plastic models.

## Setup

1. Install Ruby > 3.1.1 (I recommend [chruby](https://github.com/postmodern/chruby) or [rbenv](https://github.com/rbenv/rbenv)), and NodeJS
2. Install sqlite3
3. Install deps `% bundle install`, and `yarn`
4. Prep database `% bin/rails db:create db:migrate`
5. Optionally set up fact table seeds in database for things like `KitLine` (e.g. HGUC, MG, Volks' IMS) and
   `SourceMaterial` (things like `'gundam', 'gundam/zeta', 'mak'`) with `% bin/rails db:seed`
6. Run the server and hit the web interface:
  - `bin/rails server`
  - Usually `http://localhost:3000`

## Usage

Once you seed the database, it's time to start adding kits. Fire up the app, then navigate to `localhost:3000/kits`, and
click "Add Kit" to add the first one.

On the kit screen, you can create a `Kit`, and a `KitInstance` at the same time. A `Kit` is... well, it's kind of like
the manufacturer's SKU or catalog entry, and a `KitInstance` is the thing you actually own and build. This separation
makes keeping track of multiple copies of the same kit a lot more flexible, and lets us track things like different
states and projects or plans more easily.

A `Kit` must have a `name` and a `KitScale`, and can additionally have multiple `Producer`s, `Designer`s, `KitLine`s,
`Material`s, and `SourceMaterial`s. It can also have multiple linked kits (e.g. the Glory of the Losers option parts set
with bits for the Deathscythe, Altron, and Tallgeese II, or the base kit for a resin conversion kit).

### Updating with upstream changes

I'm hacking away, and if you have been running the app I'm trying to keep things sane for everyone.

You can update the seeded table data by reseeding. The seeds have all been written to use
`ActiveRecord#find_or_create_by`, so you shouldn't end up with endlessly duplicating `FactTable` entries.

Keep your database up to date with `bin/rails db:migrate`, though it's probably best to save your database data out via
`ColdStorage` first, just in case.

### ColdStorage

If you run `bin/rails cold_storage:freeze`, the app will save out all your kit data, with stable references to their
associations via non-database-ID anchors, to a JSON file in `cold_storage/DATE/kits__DATETIME.json`.

`bin/rails cold_storage:prune[n]` removes all saved data, save for `n` entries.

`bin/rails cold_storage:update` removes all saved data and saves one new entry.

`bin/rails cold_storage:commit` does the same, and commits that change to git.

I'm working on saving non-kit data, and rehydrating the database.

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
