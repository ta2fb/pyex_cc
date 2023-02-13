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

    conda create --name {{cookiecutter.namespace_name}}.{{cookiecutter.subpackage_name}} python={{cookiecutter.python_version}}
    conda activate {{cookiecutter.namespace_name}}.{{cookiecutter.subpackage_name}}

3. Install the code and development dependencies in the current conda environment. The pip-compile commands are only needed when updating packages, pip-sync is needed to install/sync the dependencies of your environment.

.. code-block:: bash

    pip install pip-tools
    pip-compile --no-emit-index-url requirements.in
    pip-compile --no-emit-index-url dev-requirements.in
    pip-sync dev-requirements.txt

4. Build project

.. code-block:: bash

    tox

Build commands
**************

Lint code check (run 'tox -e lint' if check fails), run tests, and build project

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

Lint code - black will automatically fix formatting issues

.. code-block:: bash

    tox -e lint

Lint code check (run 'tox -e lint' if check fails), run tests, build project, create docs, run code coverage

.. code-block:: bash

    tox -e release

Run tests

.. code-block:: bash

    tox -e run_tests

Releases
########

This project uses https://github.com/ta2fb/codeartifact_release for releases that are pushed to AWS CodeArtifact.

.. warning:: Make sure you have write permissions to the CodeArtifact repository before running this command!

.. code-block:: bash

    codeartifact-release --version x.y.z
