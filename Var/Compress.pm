package Var::Compress;

use strict;

use Var::Spiffy '-base';
require Compress::Zlib;


interface
    our %mapping = (
		   compress => \&Compress::Zlib::compress,
		   uncompress => \&Compress::Zlib::uncompress,
               );
our @EXPORT = keys %mapping;





1;
