# This WORKSPACE file defines the workspace for the Bazel build system.
# See https://bazel.build/
# https://docs.bazel.build/versions/master/build-ref.html#workspace

# TODO(regisd) Add maven 1.7.0 when cup_runtime is published
# de.jflex:jflex-maven-plugin:maven-plugin:1.6.1
maven_jar(
    name = "de_jflex_jflex_1_6_1",
    artifact = "de.jflex:jflex:1.6.1",
    repository = "https://jcenter.bintray.com/",
    sha1 = "eb4d51e1a8ea7ee96068905ddeceb9b28737c7eb",
)

# Deps used by examples.
maven_jar(
  name = "com_google_guava_guava_26_0_jre",
  artifact = "com.google.guava:guava:26.0-jre",
  repository = "http://jcenter.bintray.com/",
)
