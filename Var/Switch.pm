package Var::Switch;

use strict;

use Var::Spiffy '-base';


our @EXPORT = qw(
		 switch
		 );
sub switch {
    my $self = shift;
    my $table = ref($_[0]) ? $_[0] : {@_};
    $table->{$self->{var}};
}





1;
