from {{cookiecutter.namespace_name}}.{{cookiecutter.package_name}}.hello import hello_world


def test_hello():
    assert hello_world() == 'hello world'
