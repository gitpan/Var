package Var::Encode;

use strict;

use Var::Spiffy '-base';
our @EXPORT = qw(
		 encoding
		 guess_encoding
		 set_encoding
		 get_encoding
		 convert_encoding
		 );

require Encode::Guess;

sub guess_encoding {
    my $self = shift;
    &Encode::Guess::guess_encoding($self->{var});
}

sub convert_encoding {
    my $self = shift;
    my %arg = @_;
    my $from = $arg{from};
    my $to = $arg{to};
}




1;
