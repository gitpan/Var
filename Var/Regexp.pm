package Var::Regexp;

use strict;

use Var::Spiffy '-base';
require Regexp::List;


interface
    our %mapping = (
		   list2re => sub {
		       (new Regexp::List)->list2re(@{$_[0]});
		   }
		   );
our @EXPORT = keys %mapping;





1;
