#!/usr/bin/env bash
# Usage : install-hooks.sh — installe les hooks Git (pre-commit, commit-msg). Opt-in ; n'écrase jamais un hook existant.
cd "$(git rev-parse --show-toplevel)" || exit 2
h=$(git rev-parse --git-path hooks)
install_hook() {
  [ -e "$h/$1" ] && { echo "KO: hook $1 existe déjà, non modifié" >&2; return 1; }
  printf '#!/usr/bin/env bash\n%s\n' "$2" > "$h/$1" && chmod +x "$h/$1" && echo "OK: hook $1 installé"
}
install_hook pre-commit 'scripts/check-branch.sh && scripts/check-commit-allowed.sh'
install_hook commit-msg 'scripts/check-commit-msg.sh "$1"'
