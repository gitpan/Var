package Var;

use strict;

our $VERSION = '0.01';

eval join q//, map{ "use Var::$_;" }
qw(

   Compress Cond Crypt Digest Dump Encode Fun Lingua List Random
   Regexp Statistics StringBasic Switch HTML XML

   );
die $@ if $@; 

use Var::Spiffy '-base';
our @EXPORT = 
    qw(
       var
       array
       hash
    );


# type => type number
var_constructor 'var' => 0;
var_constructor 'array' => 1;
var_constructor 'hash' => 2;


sub new {
    my $type = shift;
    my $self = bless {}, 'Var';
    my ($args, @others) = $self->parse_arguments(@_);

    if( $type == 0 ){
	$self->{var} = $others[0];
    }
    elsif( $type == 1 ){
	$self->{var} = [ @others ];
    }
    elsif( $type == 2 ){
	$self->{var} = { @others };
    }

    $self->brutal(0);
    $self ;
}



######################################################################
# Conversion back to perl's data structure
######################################################################
sub to_array  { @{$_[0]->{var}} }
sub to_hash   { %{$_[0]->{var}} }
sub to_scalar { scalar $_[0]->{var} }

1;

__END__

