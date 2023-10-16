# Transition to workspace lints

- Take an argument of the rust project location
- Find all crate-wide lint attributes in target root files of crates listed in the workspace
  - parse top-level Cargo.toml as toml
  - read workspace.members
  - in each target's src_path, rg "#![(forbid|deny|warn|allow(($1)))]"
- Unify them by name and see if there are any listed with different levels that would conflict
  - if there are, error to go resolve?
  - or go with the level used the most and leave the remaining attributes with a comment?
- for each unique lint name:
  - remove all attributes from all workspace lib.rs files
  - add the lint to the appropriate workspace.lint table in the top-level Cargo.toml
  - `cargo clippy --fix` or stop if that doesn't succeed
  - commit the changes
- report summary for everything done and details for what wasn't done that has to be done manually

# Useful nu docs I stumbled on that I might need later

- [Editing a toml file](https://www.nushell.sh/cookbook/files.html#editing-a-file-and-then-saving-the-changes)
