load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
   name = "rules_foreign_cc",
   strip_prefix = "rules_foreign_cc-e3f4b5e0bc9dac9cf036616c13de25e6cd5051a2",
   urls = [
      "https://github.com/bazelbuild/rules_foreign_cc/archive/e3f4b5e0bc9dac9cf036616c13de25e6cd5051a2.tar.gz",
   ],
   sha256 = "136470a38dcd00c7890230402b43004dc947bf1e3dd0289dd1bd2bfb1e0a3484"
)

load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

# load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
   name = "com_google_zetasql",
   strip_prefix = "zetasql-2020.04.1",
   urls = [
      "https://github.com/google/zetasql/archive/2020.04.1.tar.gz",
   ],
   sha256 = "b1eab290101a3e4899a30f459579c590b0168bdd82fceede8bde1214eb01843d",
   patches = ["//:zetasql_parser.patch"]
)

# Install zetasql dependencies.
# see https://github.com/google/zetasql/blob/2020.04.1/WORKSPACE#L21-L50
load("@com_google_zetasql//bazel:zetasql_deps_step_1.bzl", "zetasql_deps_step_1")
zetasql_deps_step_1()

load("@com_google_zetasql//bazel:zetasql_deps_step_2.bzl", "zetasql_deps_step_2")
zetasql_deps_step_2()

load("@com_google_zetasql//bazel:zetasql_deps_step_3.bzl", "zetasql_deps_step_3")
zetasql_deps_step_3()

load("@com_google_zetasql//bazel:zetasql_deps_step_4.bzl", "zetasql_deps_step_4")
zetasql_deps_step_4()

http_archive(
    name = "io_bazel_rules_go",
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/0.18.3/rules_go-0.18.3.tar.gz"],
    sha256 = "86ae934bd4c43b99893fc64be9d9fc684b81461581df7ea8fc291c816f5ee8c5",
)
load("@io_bazel_rules_go//go:deps.bzl", "go_rules_dependencies", "go_register_toolchains")
go_rules_dependencies()
go_register_toolchains()
