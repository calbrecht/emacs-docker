run build.sh within the cloned repository.

this will create ready to run version scripts, beside one that runs given parameters on all instances,
and one test-all that runs make test with all instances.

Examples:

export EMACS_DOCKER=/path/to/emacs-docker

cd project/dir

$EMACS_DOCKER/all -Q -batch -L . -l ert-test-file.el -f ert-run-tests-batch-and-exit

EMACS=$EMACS_DOCKER/24.3 make test

$EMACS_DOCKER/all-test

$EMACS_DOCKER/24.3 -Q -L fl -L . -l fl/font-lock-studio.el somefile.el