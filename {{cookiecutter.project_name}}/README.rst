*****************************
{{cookiecutter.namespace_name}}.{{cookiecutter.subpackage_name}}
*****************************

{{cookiecutter.description}}

This repo was created from the cookie cutter https://github.com/ta2fb/pyex_cc

.. readme-marker

Development
###########

1. Download and install Anaconda or Miniconda
2. Create a new conda environment and activate it

.. code-block:: bash

    conda create --name {{cookiecutter.namespace_name}}.{{cookiecutter.subpackage_name}} python=3.6
    conda activate {{cookiecutter.namespace_name}}.{{cookiecutter.subpackage_name}}

3. Install the code and development dependencies in the current conda environment

.. code-block:: bash

    pip install -e .[dev]

4. Build project

.. code-block:: bash

    tox

Build commands
**************

Lint code, run tests, and build project

.. code-block:: bash

    tox

Build project

.. code-block:: bash

    tox -e build

Check code coverage

.. code-block:: bash

    tox -e coverage

Build sphinx docs

.. code-block:: bash

    tox -e docs

Lint code

.. code-block:: bash

    tox -e lint

Lint code, run tests, build project, create docs, run code coverage

.. code-block:: bash

    tox -e release

Run tests

.. code-block:: bash

    tox -e run_tests

Releases
########

.. warning:: Make sure you have write permissions to the s3pypi bucket before running this command!

.. code-block:: bash

    ./perform-release.sh x.y.z
