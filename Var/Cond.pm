package Var::Cond;

use strict;

use Var::Spiffy '-base';
our @EXPORT = qw(
		 if
		 elsif
		 else
		 do
		 );
sub if($) {
    $_[1];
}
sub elsif {
    $_[1];
}
sub else {
    1;
}
sub do {
    
}


1;
