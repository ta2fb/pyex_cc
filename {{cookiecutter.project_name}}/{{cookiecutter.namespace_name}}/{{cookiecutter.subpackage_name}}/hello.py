"""Hello file"""


def hello_world(text: str = 'hello world') -> str:
    """Hello world documentation

    This project uses the Google Style Python Docstrings

    https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html

    Args:
        text: Text to return

    Returns:
        String of text passed to the function
    """

    return text
