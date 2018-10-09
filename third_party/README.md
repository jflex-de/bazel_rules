# Third-party libraries


The directory contains aliases for third-party libraries.

Essentially, it allows in dependencies to replace the WORKSPACE name:

    deps = ["@com_google_guava//jar"]

by a more meaningful:

    deps = ["//third_party/com/google/guava"]


Also, it allows to add a short description in `third_party/com/google/guava/BUILD`.

See [best practice for third-party libraries][be_3p].

[be_3p]: https://docs.bazel.build/versions/master/best-practices.html#third-party-dependencies
