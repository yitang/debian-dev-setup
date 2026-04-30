# AGENTS.md

## Repo structure
- Org-mode docs (`README.org`, `main.org`) + standalone bash scripts. Each `.sh` is a self-contained setup script for one tool category.
- No build system, no tests, no CI. Scripts are the source of truth.
- Branch: `master`. Remote: `git@github.com:yitang/debian-dev-setup.git`.

## Running scripts
- All scripts require `sudo` (each runs `sudo -K` to clear cached credentials first).
- Run individually: `bash base_dev_tools.sh`, `bash python.sh`, etc.
- No dependency ordering enforced between scripts — run what you need.
- `set -e` (or `set -x -e` in python.sh, R.sh) means scripts abort on first error. python.sh and R.sh print each command before executing (verbose).

## Script ownership
| File | What it installs |
|---|---|
| `base_dev_tools.sh` | build-essential, git, libcurl4-openssl-dev, libssl-dev |
| `python.sh` | python3, pip3, csvkit, snakemake (conda section commented out) |
| `R.sh` | r-cran packages (car, Rcpp, reshape2, ggplot2, randomforest, glmnet, devtools) |
| `latex.sh` | texlive base/extra/math/science/fonts, latex2html |
| `docker.sh` | Docker CE (note: references old Debian codename "buster") |
| `emacs.sh` | Builds Emacs from source (default 30.1, or pass version: `bash emacs.sh 29.4`) with tree-sitter, xwidgets, native-comp. Auto-detects webkit2gtk package for Debian release. |
| `misc.sh` | ledger, jekyll, ack-grep, guake, graphviz, tree, mailspring |

## Gotchas
- `emacs.sh` downloads a tarball from ftp.gnu.org, not a git clone. Accepts a version argument (default 30.1). Auto-detects webkit2gtk package (`4.1-dev` for trixie+, `4.0-dev` for older).
- `docker.sh` hardcodes Debian codename `buster`. Update for your Debian release.
- `misc.sh` has commented-out lines for postgresql, awscli, snakemake, Pygments — not active.
- `python.sh` has a large block of commented-out installs (pip packages, xgboost, hyperopt).
- `main.org`: Debian 11→12 upgrade steps (replace `bullseye` with `bookworm` in `/etc/apt/sources.list`, then `dist-upgrade`).
