package Var::Fun;

use strict;

use Var::Spiffy '-base';

require Text::Bastardize;
interface
    our %mapping = (
		    bastardize => sub {
			my $text = shift;
			my $b = new Text::Bastardize;
			foreach my $t (@_){
			    $t =~ s/^-//o;
			    if($t eq 'pig' ||
			       $t eq 'k3wlt0k' ||
			       $t eq 'rot13' ||
			       $t eq 'censor' ||
			       $t eq 'n20e'){
				$b->charge($text);
				$text = ($b->$t($text))[0];
			    }
			}
			$text
			},

		    );


our @EXPORT = keys %mapping;





1;
