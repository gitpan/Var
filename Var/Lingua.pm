package Var::Lingua;

use strict;

use Var::Spiffy '-base';

require Lingua::EN::Numbers;
require Lingua::ZH::Numbers;

interface
    our %mapping = (
		   number_to_en => sub {
		       my $n = new Lingua::EN::Numbers($_[0]);
		       defined $n ? $n->get_string : undef;
		   },
		   number_to_zh => sub {
		     Lingua::ZH::Numbers->charset('big5');
		       &Lingua::ZH::Numbers::number_to_zh( $_[0] );
		   },
               );

our @EXPORT = keys %mapping;


1;
