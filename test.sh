#!/usr/bin/env bash
set -uo pipefail

# Tests demonstrating ruff's diff behavior with non-fixable rules

echo "Test 1: ruff check without --diff should report error and exit non-zero"
set -x
ruff check example.py
exit_code=$?
set +x
if [ $exit_code -eq 0 ]; then
    echo "FAIL: Expected non-zero exit code"
    exit 1
fi
echo "PASS"

echo ""
echo "Test 2: ruff check with --diff should exit zero with no output"
set -x
ruff check --diff example.py
exit_code=$?
set +x
if [ $exit_code -ne 0 ]; then
    echo "FAIL: Expected zero exit code"
    exit 1
fi
echo "PASS"

echo ""
echo "Test 3: ruff check with --fix should exit non-zero for non-fixable rules"
set -x
ruff check --fix example.py
exit_code=$?
set +x
if [ $exit_code -eq 0 ]; then
    echo "FAIL: Expected non-zero exit code"
    exit 1
fi
echo "PASS"

echo ""
echo "All tests passed!"
