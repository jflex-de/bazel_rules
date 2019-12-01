# Java CUP
# http://www2.cs.tum.edu/projekte/cup/

package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # CUP License

# Version java-cup-bin-11b-20160615
java_import(
    name = "cup",
    jars = ["java-cup-11b.jar"],
)

java_binary(
    name = "cup_bin",
    main_class = "java_cup.Main",
    runtime_deps = [":cup"],
)
