package Var::StringBasic;

use strict;

use Var::Spiffy '-base';

interface 
    our %mapping = (
		   reverse => sub { scalar CORE::reverse $_[0] },
		   concat => sub { $_[0].$_[1] },
		   append => sub { $_[0].$_[1] },
		   prepend => sub { $_[1].$_[0] },
		   uc => sub { CORE::uc $_[0] },
		   lc => sub { CORE::lc $_[0] },
		   ucfirst => sub { CORE::ucfirst $_[0] },
		   lcfirst => sub { CORE::lcfirst $_[0] },

		   length => sub { CORE::length $_[0] },
		   chop => sub { my $t = shift; CORE::chop $t; $t },
		   chomp => sub { my $t = shift; CORE::chomp $t; $t },

		   substr => sub {
		       my $text = shift;
		       my ($offset, $len, $replac) = @_;
		       CORE::substr( $text, $offset, $len, $replac);
		   },

		   strip_space  => sub { my $t = shift; $t =~ s/\s+//go; $t },
		   strip_lspace => sub { $_[0] =~ /^\s*(.+)$/o; $1 },
		   strip_rspace => sub { $_[0] =~ /^(.+?)\s*$/o; $1 },
		    split => sub { [ split qr"$_[1]", $_[0] ] },
		   );


our @EXPORT = keys(%mapping);



1;
