#!/bin/sh

# Copyright (C) Viktor Szakats. See LICENSE.md
# SPDX-License-Identifier: MIT

# shellcheck disable=SC3040,SC2039
set -o xtrace -o errexit -o nounset; [ -n "${BASH:-}${ZSH_NAME:-}" ] && set -o pipefail

export _NAM _VER _OUT _BAS _DST

_NAM="$(basename "$0" | cut -f 1 -d '.')"
_VER="$1"

(
  cd "${_NAM}" || exit 0

  rm -r -f "${_PKGDIR}" "${_BLDDIR}"

  options="${_CONFIGURE_GLOBAL}"
  export CC="${_CC_GLOBAL}"
  export CFLAGS="${_CFLAGS_GLOBAL} -O3 -Wa,--noexecstack"
  export CPPFLAGS="${_CPPFLAGS_GLOBAL}"
  export LDFLAGS="${_LDFLAGS_GLOBAL} ${_LDFLAGS_GLOBAL_AUTOTOOLS}"
  export LIBS="${_LIBS_GLOBAL}"

  [ "${LIBRESSL_VER_}" = '3.8.0' ] && options="${options} --disable-asm"

  if [ "${_CC}" = 'llvm' ]; then
    CFLAGS="${CFLAGS} -Wno-inconsistent-dllimport"
  else
    CFLAGS="${CFLAGS} -Wno-attributes"
  fi

  _my_prefix='C:/Windows/libressl'
  _ssldir="ssl"

  (
    mkdir "${_BLDDIR}"; cd "${_BLDDIR}"
    # shellcheck disable=SC2086
    ../configure ${options} \
      --enable-static \
      --disable-shared \
      --disable-tests \
      "--prefix=${_my_prefix}" \
      "--with-openssldir=${_my_prefix}/${_ssldir}" --silent
  )

  # Ending slash required.
  make --directory="${_BLDDIR}" --jobs="${_JOBS}" install "DESTDIR=$(pwd)/${_PKGDIR}/" >/dev/null # 2>&1

  # LibreSSL does not strip the drive letter
  #   ./libressl/${_PKGDIR}/C:/Windows/libressl
  # Some tools (e.g. CMake) become weird when colons appear in a filename,
  # so move results to a sane, standard path:

  mkdir -p "./${_PP}"
  mv "${_PKGDIR}/${_my_prefix}"/* "${_PP}"

  # Delete .pc and .la files
  rm -r -f "${_PP}"/lib/pkgconfig
  rm -f    "${_PP}"/lib/*.la

  . ../libressl-pkg.sh
)
