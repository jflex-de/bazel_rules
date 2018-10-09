def jflex_deps():
    """Bazel macro that iports dependencies used by JFlex."""

    native.maven_jar(
        name = "de_jflex_jflex_1_7_0",
        artifact = "de.jflex:jflex:1.7.0",
        repository = "https://jcenter.bintray.com/",
    )

    native.maven_jar(
        name = "de_jflex_cup_runtime_11b",
        artifact = "de.jflex:cup_runtime:11b",
        repository = "https://jcenter.bintray.com/",
    )


    # Deps used by examples.
    native.maven_jar(
      name = "com_google_guava_guava_26_0_jre",
      artifact = "com.google.guava:guava:26.0-jre",
      repository = "http://jcenter.bintray.com/",
    )
