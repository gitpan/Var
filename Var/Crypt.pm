package Var::Crypt;

use strict;

use Var::Spiffy '-base';
interface
    our %mapping =
    (
     crypt => sub { CORE::crypt($_[0], $_[1]) }
     );

our @EXPORT = keys %mapping;




1;
