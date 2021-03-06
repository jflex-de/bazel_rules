# Copyright 2018-2019 Google LLC.
# SPDX-License-Identifier: Apache-2.0

# This WORKSPACE file defines the workspace for the Bazel build system.
# See https://docs.bazel.build/versions/master/build-ref.html#workspace

load("//jflex:deps.bzl", "JFLEX_ARTIFACTS")
load("//third_party:third_party_deps.bzl", "THIRD_PARTY_ARTIFACTS")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_JVM_EXTERNAL_TAG = "3.3"

RULES_JVM_EXTERNAL_SHA = "d85951a92c0908c80bd8551002d66cb23c3434409c814179c0ff026b53544dab"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    name = "maven",
    artifacts = JFLEX_ARTIFACTS + THIRD_PARTY_ARTIFACTS,
    maven_install_json = "//:maven_install.json",
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com/",
        "https://repo1.maven.org/maven2/",
    ],
)

load("@maven//:defs.bzl", "pinned_maven_install")

pinned_maven_install()
