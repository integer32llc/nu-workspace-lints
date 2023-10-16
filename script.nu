def main [rust_project_dir: path] {
    # Get the JSON output of cargo metadata for the project whose root Cargo.toml is at the
    # specified directory
    let metadata = (
        cargo metadata --format-version 1 --manifest-path $"($rust_project_dir)/Cargo.toml" |
        from json
    )

    (
        # For each workspace member,
        $metadata.workspace_members |
        each { |crate|
            (
                # Look up its targets in the `packages` metadata and get the `src_path` of each
                # target's root file.
                $metadata.packages |
                where id == $crate |
                get targets |
                each { |target|
                    get src_path
                } |
                flatten
            )
        } |
        flatten
    )
}
