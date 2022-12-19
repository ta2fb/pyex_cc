*******
pyex_cc
*******

This project is based on tools discussed in the book *Serious Python: Black-Belt Advice on Deployment, Scalability, Testing, and More* by Julian Danjou

Cookiecutter initial instructions
#################################

Assumptions

* Git repository is hosted on GitHub
* PyPI repository is hosted on AWS CodeArtifact

Instructions for using this cookiecutter

1. Download and install Anaconda or Miniconda
2. Create a new conda environment and activate it

.. code-block:: bash

    conda create --name pyex_cc python={{cookiecutter.python_version}}
    conda activate pyex_cc

3. Install cookiecutter

.. code-block:: bash

    pip install cookiecutter

4. Create new project with pyex_cc

.. code-block:: bash

    # for ssh credentials
    cookiecutter git@github.com:ta2fb/pyex_cc.git
    # for https credentials
    cookiecutter https://github.com/ta2fb/pyex_cc

5. Create git repository on GitHub

6. Change to project directory and initialize git

.. code-block:: bash

    cd {{cookiecutter.project_name}}
    git init

7. Set remote origin to GitHub git repository url

.. code-block:: bash

    # for ssh credentials
    git remote add origin git@github.com:{{cookiecutter.github_org}}/{{cookiecutter.project_name}}.git
    # for https credentials
    git remote add origin https://github.com/{{cookiecutter.github_org}}/{{cookiecutter.project_name}}.git


9. Deactivate pyex_cc conda environment

.. code-block:: bash

    conda deactivate

10. Continue with the steps in the Development section within the new project created


Cookiecutter packages and purposes
##################################

* codeartifact-release (https://github.com/ta2fb/codeartifact_release)

  * Cuts releases and pushes artifacts to AWS CodeArtifact

* pbr

  * Part of setuptools configuration
  * Automatic generation of Sphinx documentation
  * Automatic generation of AUTHORS and ChangeLog files based on git history
  * Automatic creation of file lists for git
  * Version management based on git tags using semantic versioning

* pytest

  * Unit testing

* pytest-cov

  * Code coverage

* pytest-xdist (not implemented yet)

  * Run tests on multiple CPUs (pytest -n NUM)

* sphinx

  * Code documentation
  * Themes to choose from: https://sphinx-themes.org/
  * After building documentation can be viewed in your browser at

    * file:///path/to/{cookiecutter.project_name}}/build/sphinx/html/index.html

* setuptools

  * Project configuration

* tox

  * Automate and standardize testing and building of the project
  * Builds clean environments for proper testing of code

* tox-conda

  * Plugin that forces tox to use conda environments instead of virtualenvs

