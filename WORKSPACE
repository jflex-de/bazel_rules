# Copyright 2018-2019 Google LLC.
# SPDX-License-Identifier: Apache-2.0

# This WORKSPACE file defines the workspace for the Bazel build system.
# See https://docs.bazel.build/versions/master/build-ref.html#workspace

load("//jflex:deps.bzl", "JFLEX_DEPS")
load("//third_party:third_party_deps.bzl", "THIRD_PARTY_ARTIFACTS")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_JVM_EXTERNAL_TAG = "2.10"

RULES_JVM_EXTERNAL_SHA = "1bbf2e48d07686707dd85357e9a94da775e1dbd7c464272b3664283c9c716d26"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    name = "maven",
    artifacts = THIRD_PARTY_ARTIFACTS + JFLEX_DEPS,
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com/",
        "https://repo1.maven.org/maven2/",
    ],
    maven_install_json = "//:maven_install.json",
)

load("@maven//:defs.bzl", "pinned_maven_install")
pinned_maven_install()
