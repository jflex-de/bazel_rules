# Please keep deps in alphabetical order
def third_party_deps():

    native.maven_jar(
        name = "com_google_guava_guava_26_0_jre",
        artifact = "com.google.guava:guava:26.0-jre",
        repository = "http://jcenter.bintray.com/",
    )
    native.maven_jar(
        name = "com_google_truth_truth",
        artifact = "com.google.truth:truth:0.42",
        repository = "http://jcenter.bintray.com/",
    )
