#!/bin/sh

# Copyright (C) Viktor Szakats. See LICENSE.md
# SPDX-License-Identifier: MIT

# NOTE: Bump nghttp3 and ngtcp2 together with curl.

export DOCKER_IMAGE='debian:testing-20230814-slim'

export CURL_VER_='8.2.1'
export CURL_HASH=dd322f6bd0a20e6cebdfd388f69e98c3d183bed792cf4713c8a7ef498cba4894
# Create revision string
# NOTE: Set _REV to 1 after bumping CURL_VER_, then increment for each
#       CI rebuild via `main` branch push (e.g. after bumping a dependency).
export _REV="${CW_REVISION:-7}"

export CACERT_VER_='2023-08-22'
export CACERT_HASH=23c2469e2a568362a62eecf1b49ed90a15621e6fa30e29947ded3436422de9b9
export BROTLI_VER_='1.0.9'
export BROTLI_HASH=f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46
export CARES_VER_='1.19.1'
export CARES_HASH=321700399b72ed0e037d0074c629e7741f6b2ec2dda92956abe3e9671d3e268e
export GSASL_VER_='2.2.0'
export GSASL_HASH=79b868e3b9976dc484d59b29ca0ae8897be96ce4d36d32aed5d935a7a3307759
export LIBIDN2_VER_='2.3.4'
export LIBIDN2_HASH=93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f
export LIBUNISTRING_VER_='1.1'
export LIBUNISTRING_HASH=827c1eb9cb6e7c738b171745dac0888aa58c5924df2e59239318383de0729b98
export LIBICONV_VER_='1.17'
export LIBICONV_HASH=8f74213b56238c85a50a5329f77e06198771e70dd9a739779f4c02f65d971313
export LIBPSL_VER_='0.21.2'
export LIBPSL_HASH=e35991b6e17001afa2c0ca3b10c357650602b92596209b7492802f3768a6285f
export WOLFSSH_VER_='1.4.13'
export WOLFSSH_HASH=95de536d2390ca4a8a7f9be4b2faaaebb61dcedf2c6571107172d4a64347421c
export LIBSSH_VER_='0.10.5'
export LIBSSH_HASH=b60e2ff7f367b9eee2b5634d3a63303ddfede0e6a18dfca88c44a8770e7e4234
export LIBSSH2_VER_='1.11.0'
export LIBSSH2_HASH=a488a22625296342ddae862de1d59633e6d446eff8417398e06674a49be3d7c2
export LIBSSH2_CPPFLAGS='-DLIBSSH2_NO_DSA -DLIBSSH2_NO_BLOWFISH -DLIBSSH2_NO_RC4 -DLIBSSH2_NO_HMAC_RIPEMD -DLIBSSH2_NO_CAST -DLIBSSH2_NO_3DES -DLIBSSH2_NO_MD5'
export NGHTTP2_VER_='1.55.1'
export NGHTTP2_HASH=19490b7c8c2ded1cf7c3e3a54ef4304e3a7876ae2d950d60a81d0dc6053be419
export NGHTTP3_VER_='0.14.0'
export NGHTTP3_HASH=b5704b72f7a025292f2ff328e41c41f5e486f8e46c5bb020c68dfa8d35e82727
export NGTCP2_VER_='0.18.0'
export NGTCP2_HASH=c52ba414c3301e73b17ebc15518039e5f235a75adb9d0537555cbc13ac072ac7
export WOLFSSL_VER_='5.6.3'
export WOLFSSL_HASH=2e74a397fa797c2902d7467d500de904907666afb4ff80f6464f6efd5afb114a
export MBEDTLS_VER_='3.4.1'
export MBEDTLS_HASH=a420fcf7103e54e775c383e3751729b8fb2dcd087f6165befd13f28315f754f5
export QUICTLS_VER_='3.1.2'
export QUICTLS_HASH=d3e07211e6b76ac835f1ff5787d42af663fbc62e4e42ec14777deec0f53d1627
export OPENSSL_VER_='3.1.2'
export OPENSSL_HASH=a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539
export BORINGSSL_VER_='b8e012e1ff736cc794273af4a7db521e6b18bcd5'
export BORINGSSL_HASH=caed052df6385d5e768ef5668d00b01dfa4a12d06f0ac3af4a05d63a84dd56d1
export LIBRESSL_VER_='3.7.3'
export LIBRESSL_HASH=7948c856a90c825bd7268b6f85674a8dcd254bae42e221781b24e3f8dc335db3
export ZLIBNG_VER_='2.1.3'
export ZLIBNG_HASH=d20e55f89d71991c59f1c5ad1ef944815e5850526c0d9cd8e504eaed5b24491a
export ZLIB_VER_='1.3'
export ZLIB_HASH=8a9ba2898e1d0d774eca6ba5b4627a11e5588ba85c8851336eb38de4683050a7
export ZSTD_VER_='1.5.5'
export ZSTD_HASH=9c4396cc829cfae319a6e2615202e82aad41372073482fce286fac78646d3ee4
if [ "${_BRANCH#*dev*}" != "${_BRANCH}" ]; then
export LLVM_MINGW_LINUX_X86_64_VER_='20230730'
export LLVM_MINGW_LINUX_X86_64_HASH=f39addf4a085ba9509266a801a557c649365e41609e2c104cd048ffed33dfb06
export LLVM_MINGW_LINUX_AARCH64_VER_='20230730'
export LLVM_MINGW_LINUX_AARCH64_HASH=78346d7f77cb459934d6457f55e70676e26793e943cdc326e317864690bfb3b8
export LLVM_MINGW_MAC_VER_='20230730'
export LLVM_MINGW_MAC_HASH=e08db49aab53fd90996fb531ca0de3917e7430bd27b3bf2a8b1ad1cc7c07e0ce
export LLVM_MINGW_WIN_VER_='20230730'
export LLVM_MINGW_WIN_HASH=767094acfd950fdf236755c482a6aabad057f4fea8193c85cfe214105e684bfc
else
export LLVM_MINGW_LINUX_X86_64_VER_='20230614'
export LLVM_MINGW_LINUX_X86_64_HASH=9ae925f9b205a92318010a396170e69f74be179ff549200e8122d3845ca243b8
export LLVM_MINGW_LINUX_AARCH64_VER_='20230614'
export LLVM_MINGW_LINUX_AARCH64_HASH=b8abfec65e53fcfc7a605b9fc86253d507e126f0ef333e2766091aa077fd9e89
export LLVM_MINGW_MAC_VER_='20230614'
export LLVM_MINGW_MAC_HASH=e576b9a8121dc90332874c8ef7c9973cde6695de3a43d1dfb912fe8cc878722b
export LLVM_MINGW_WIN_VER_='20230614'
export LLVM_MINGW_WIN_HASH=94bc977c32cc70105d09dfa24d747effe187244ecd2aa669d50b69602a245236
fi
