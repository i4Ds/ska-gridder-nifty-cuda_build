Anaconda ska-gridder-nifty-cuda Build
===========================================================

The repository is for building different Anaconda packages from [ska-gridder-nifty-cuda](https://gitlab.com/ska-telescope/sdp/ska-gridder-nifty-cuda/-/tree/sim-874-python-wrapper) with different versions. For this the following setup is provided:

## Version Management
- The `main` branch is for the general setup, where GitHub actions as well as global changes (affecting ALL versions) can be changed. The `main` branch should never form a new version, but is only used for orchestration.
- From the `main` branch different branches are created for each major version. One can consider whether for smaller version releases the existing branch should be changed or not. For larger releases in any case there is one branch per version. If changes should be added from the `main` branch, the `main` branch has to be merged into the corresponding version branch.
- The only place where the package version should be changed is in `.github/workflows/build.yaml env:VERSION`.
 
## Dev Management
- So that existing builds, which are needed for the user installations, are not overwritten if a change of the build is desired, so-called `dev` branches are to be created from the version branches. For these it is mandatory to **change the version** in `build.yaml` (as described in *Version Management*) to [PEP 440](https://peps.python.org/pep-0440/) comforme dev version. An example would be version `0.7.0` becomes `0.7.dev0`.
- **In addition, change** `.github/workflows/build.yaml env:LABEL` from `main` to `dev`. This is common setup according to [Anaconda Documentation](https://docs.anaconda.com/anacondaorg/user-guide/tutorials/).
- The build of the `dev` branches triggers a build and can be referenced using \<pkg>=\<version>. So once the `dev` branch has been tested, it can be merged into the version branch using a pull request, which triggers a new build of the corresponding version.
- To include the `dev` builds in the current development, the `environment.yaml` can be adjusted to the corresponding version (and channel if necessary).
- The `dev` branches are not mandatory for the development, because actually the normal builds are considered. However, once a package is live and available for user installation, this procedure is recommended.

## Additional Information

- For safety, the upload to the Anaconda registry does not have a `--force` included per default. This means that when publishing, the existing package must be removed manually or the upload must be forced in the specific branch. It is recommended to archive the previous build before a build is overwritten.
- The builds are triggered of GitHub Actions from branches following the [glob pattern](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#filter-pattern-cheat-sheet) `[0-9]*.[0-9]*.[dev0-9]*` on pushes and pull requests.
- If you just want to merge the changes from main into a version branch, but not trigger a build from GitHub Actions, just set something like `[skip ci]` (see [Skipping workflow runs](https://docs.github.com/en/actions/managing-workflow-runs/skipping-workflow-runs)) in your commit message.
