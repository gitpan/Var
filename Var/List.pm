package Var::List;

use strict;

use Var::Spiffy '-base';

require List::Util;
require Statistics::Lite;

interface
    our %mapping = (
		    size => sub {
		      CORE::scalar @{$_[0]};
		    },
		    max => sub { &List::Util::max(@{$_[0]}) },
		    min => sub { &List::Util::min(@{$_[0]}) },
		    minstr => sub { &List::Util::minstr(@{$_[0]}) },
		    maxstr => sub { &List::Util::maxstr(@{$_[0]}) },
		    shuffle => sub { [ &List::Util::shuffle(@{$_[0]}) ] },
		    first => sub {
			my $var = shift;
			my $func = ref($_[0]) eq 'CODE' ?
			    shift : $_[0]=~ /\$/o ?
				eval 'sub { '.shift().' }' :
				    eval 'sub {$a '.shift().' $b};';
			&List::Util::first($func, @{$var});
		    },
		    reduce => sub {
			my $var = shift;
			my $func = ref($_[0]) eq 'CODE' ?
			    shift : $_[0]=~ /\$/o ?
				eval 'sub { '.shift().' }' :
				    eval 'sub {$a '.shift().' $b};' ;
			&List::Util::reduce($func, @{$var});
		    },
		    join => sub { join $_[1], @{$_[0]} },
		   );


sub list_stat_methods {
    my $package = caller;
    no strict 'refs';
    foreach my $func (@_){
        next if defined &{"${package}::$func"};
        *{"${package}::$func"} =
	    sub {
		my $self = shift;
		&{"Statistics::Lite::".$func}(@{$self->{var}});
	    };
         }
}


list_stat_methods
    my @stat_methods = qw(range mean median mode sum stddev variance);

our @EXPORT = (
	       keys(%mapping),
	       @stat_methods
	       );

1;

__END__

$var = var(@array);
$var->size();
$var->keys_size();
$var->reverse();
$var->split(//);
$var->join(q//);
$var->sort()

