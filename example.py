"""
Simple example of ruff's diff behaviour.

This file should fail D404 due to non-imperitive docstring.
"""


def example_function():
    """This is an example function that does nothing."""
    pass


if __name__ == "__main__":
    example_function()
