*******
pyex_cc
*******

This project is based on tools discussed in the book *Serious Python: Black-Belt Advice on Deployment, Scalability, Testing, and More* by Julian Danjou

Cookiecutter initial instructions
#################################

Assumptions

* Git repository is hosted on AWS CodeCommit
* PyPI repository is backed by s3 and uses s3pypi

Instructions for using this cookiecutter

1. Download and install Anaconda or Miniconda
2. Create a new conda environment and activate it

.. code-block:: bash

    conda create --name pyex_cc python=3.8
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

5. Create git repository on AWS CodeCommit

.. code-block:: bash

    aws codecommit create-repository --repository-name {{cookiecutter.project_name}} --repository-description {{cookiecutter.description}}

6. Configure CodeCommit credentials accordingly

.. _Using IAM with CodeCommit\: Git Credentials, SSH Keys, and AWS Access Keys: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html

7. Change to project directory and initialize git

.. code-block:: bash

    cd {{cookiecutter.project_name}}
    git init

8. Set remote origin to CodeCommit git repository url

.. code-block:: bash

    # for ssh credentials
    git remote add origin ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/{{cookiecutter.project_name}}
    # for https credentials
    git remote add origin https://git-codecommit.us-east-1.amazonaws.com/v1/repos/{{cookiecutter.project_name}}

.. note:: You may need to change the region in the above urls

9. Deactivate pyex_cc conda environment

.. code-block:: bash

    conda deactivate pyex_cc

10. Continue with the steps in the Development section within the new project created


Cookiecutter packages and purposes
##################################

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

