# Copyright 2018-2019 Google LLC.
# SPDX-License-Identifier: Apache-2.0

# maven_install can only be used in WORKSPACE, so we will keep the deprecated maven_jar for some
# time.
def jflex_deps():
    """Bazel macro that imports dependencies used by JFlex."""

    native.maven_jar(
        name = "de_jflex_jflex_1_7_0",
        artifact = "de.jflex:jflex:1.7.0",
        repository = "https://jcenter.bintray.com/",
        sha256 = "c40e64600f7d29e1618a1c1d5cd697c926ff8495e166ea9416cae19644e37ae6",
        sha256_src = "3b18eb44332183ac1fbbf4573da1f2e8a373b71899a9d05a0d70308d5c5a56f3",
    )

    native.maven_jar(
        name = "de_jflex_cup_runtime_11b",
        artifact = "de.jflex:cup_runtime:11b",
        repository = "https://jcenter.bintray.com/",
        sha256 = "9c0b5c93fe0c0e239d5f92affb672cb7c45122c3e3de8cda9513fa8e39dbbc3c",
        sha256_src = "7155a72ab7b2d6c1ecf129bcacfbe942d0b490bfe1d634532e5619a836e17591",
    )
