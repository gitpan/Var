package Var::Digest;

use strict;

use Var::Spiffy '-base';

require Digest::MD2;
require Digest::MD5;
require Digest::SHA1;
require String::CRC32;
require Digest::HMAC_MD5;

interface
    our %mapping = (
		   md5 => \&Digest::MD5::md5,
		   md5_hex => \&Digest::MD5::md5_hex,
		   md5_base64 => \&Digest::MD5::md5_base64,

                   md2 => \&Digest::MD2::md2,
                   md2_hex => \&Digest::MD2::md2_hex,
                   md2_base64 => \&Digest::MD2::md2_base64,

                   sha1 => \&Digest::SHA1::sha1,
                   sha1_hex => \&Digest::SHA1::sha1_hex,
                   sha1_base64 => \&Digest::SHA1::sha1_base64,

                   hmac_md5 => \&Digest::HMAC_MD5::hmac_md5,
		   hmac_md5_hex => \&Digest::HMAC_MD5::hmac_md5_hex,

		   crc => \&String::CRC32::crc32
		   );

our @EXPORT = keys %mapping;


1;
