#! /bin/sh -e

function test {
    ../oclint-xcodebuild $1
    diff $1.json compile_commands.json
}

test xcode-5.0-5A11314m-pchpch
test full-project-1
test full-project-2
test product-name-with-space

function test_with_arch_conversion {
    ../oclint-xcodebuild -convert-arm64-to-arm $1
    diff $1.json compile_commands.json
}

test_with_arch_conversion arm64
