load("@fbsource//xplat/executorch/build:runtime_wrapper.bzl", "get_aten_mode_options", "runtime")

def define_common_targets():
    """Defines targets that should be shared between fbcode and xplat.

    The directory containing this targets.bzl file should also contain both
    TARGETS and BUCK files that call this function.
    """

    runtime.cxx_test(
        name = "span_test",
        srcs = ["span_test.cpp"],
        deps = [
            "//executorch/runtime/core:core",
        ],
    )

    runtime.cxx_test(
        name = "tensor_layout_test",
        srcs = ["tensor_layout_test.cpp"],
        deps = [
            "//executorch/runtime/core:tensor_layout",
        ],
    )

    runtime.cxx_test(
        name = "error_handling_test",
        srcs = [
            "error_handling_test.cpp",
        ],
        deps = [
            "//executorch/runtime/core:core",
        ],
    )

    runtime.cxx_test(
        name = "function_ref_test",
        srcs = [
            "function_ref_test.cpp",
        ],
        deps = [
            "//executorch/runtime/core:core",
        ],
    )
    
    runtime.cxx_test(
        name = "event_tracer_test",
        srcs = [
            "event_tracer_test.cpp",
        ],
        deps = [
            "//executorch/runtime/core:event_tracer",
            "//executorch/runtime/core/portable_type/c10/c10:c10",
        ],
    )

    runtime.cxx_test(
        name = "freeable_buffer_test",
        srcs = [
            "freeable_buffer_test.cpp",
        ],
        deps = [
            "//executorch/runtime/core:core",
        ],
    )

    runtime.cxx_test(
        name = "array_ref_test",
        srcs = ["array_ref_test.cpp"],
        deps = [
            "//executorch/runtime/core:core",
        ],
    )

    runtime.cxx_test(
        name = "memory_allocator_test",
        srcs = [
            "memory_allocator_test.cpp",
        ],
        deps = [
            "//executorch/runtime/core:memory_allocator",
            "//executorch/runtime/core/portable_type/c10/c10:c10",
        ],
    )

    runtime.cxx_test(
        name = "hierarchical_allocator_test",
        srcs = [
            "hierarchical_allocator_test.cpp",
        ],
        deps = [
            "//executorch/runtime/core:memory_allocator",
        ],
    )

    runtime.cxx_test(
        name = "tag_test",
        srcs = [
            "tag_test.cpp",
        ],
        deps = [
            "//executorch/runtime/core:tag",
        ],
        preprocessor_flags = [
            "-DET_ENABLE_ENUM_STRINGS"
        ],
    )

    if True in get_aten_mode_options():
        runtime.cxx_test(
            name = "tensor_shape_dynamism_test_aten",
            srcs = ["tensor_shape_dynamism_test_aten.cpp"],
            deps = [
                "//executorch/runtime/core/exec_aten:lib_aten",
                "//executorch/runtime/core/exec_aten/testing_util:tensor_util_aten",
            ],
        )

    for aten_mode in get_aten_mode_options():
        aten_suffix = "_aten" if aten_mode else ""

        runtime.cxx_test(
            name = "evalue_test" + aten_suffix,
            srcs = ["evalue_test.cpp"],
            deps = [
                "//executorch/runtime/core/exec_aten:lib" + aten_suffix,
                "//executorch/runtime/core/exec_aten/testing_util:tensor_util" + aten_suffix,
                "//executorch/runtime/core:evalue" + aten_suffix,
            ],
        )
