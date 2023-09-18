def main [rust_project_dir: path] {
    open $"($rust_project_dir)/Cargo.toml" | get workspace.members | get 26 | each { |crate|
        $"($rust_project_dir)/($crate)/src/lib.rs"
        # open $"($rust_project_dir)/($crate)/src/lib.rs"
    }
}
