package Var::Random;

use strict;

use Var::Spiffy '-base';

require String::Random;
interface
    our %mapping = (
		   'randomize' => \&String::Random::random_string
		   );
our @EXPORT = keys %mapping;


1;
