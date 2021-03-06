#!/usr/bin/env bash

set -o posix

## This command unpacks a specific version of a release.
## This does NOT install the version.

set -e

if [ -z "$1" ]; then
    fail "Missing version argument\nUsage: $REL_NAME unpack <version>"
fi

if [ ! -z "$RELEASE_READ_ONLY" ]; then
    fail "Cannot unpack a release with RELEASE_READ_ONLY set!"
fi

require_cookie
require_live_node

exec nodetool "unpack_release" \
        --release="$REL_NAME" \
        --version="$2"
