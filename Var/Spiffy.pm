package Var::Spiffy;

use strict;
use Spiffy '-base';
use Data::Dumper;
our @EXPORT = qw(
		 attribute
		 interface
		 oo_interface
		 var_constructor
		 list_stat_methods
		 Dumper
		 );


sub attribute {
    my $package = caller;
    my ($attribute, $default) = @_;
    no strict 'refs';
    return if defined &{"${package}::$attribute"};
    *{"${package}::$attribute"} =
      sub {
	my $self = shift;
	unless (exists $self->{$attribute}) {
	  $self->{$attribute} =
            ref($default) eq 'ARRAY' ? [] :
	      ref($default) eq 'HASH' ? {} :
		$default;
	}
	$self->{$attribute} = defined $_[0] ? shift : $self->{$attribute};
	$self;
      };
}

attribute brutal => 0;
attribute encoding => 'utf8';


sub var_constructor {
    my $package = caller;
    my ($constructor, $type) = @_;
    no strict 'refs';
    return if defined &{"${package}::$constructor"};
    *{"${package}::$constructor"} =
      sub {
	  &{"${package}::new"}($type, @_);
      };
}

sub interface {
  my $package = caller;
  no strict 'refs';
  my %interface = @_;
  while(my($method, $backend) = each %interface){
    next if defined &{"${package}::$method"};
    *{"${package}::$method"} =
      sub {
	my $self = shift;
	my $rv = $backend->($self->{var}, @_);
	$self->{var} = $rv if $self->{brutal};
	return @$rv if ref $rv eq 'ARRAY';
	return %$rv if ref $rv eq 'HASH';
	return $rv;
      };
    }

}


# interface to which $self is passed.
sub oo_interface {
  my $package = caller;
  no strict 'refs';
  my %interface = @_;
  while(my($method, $backend) = each %interface){
    next if defined &{"${package}::$method"};
    *{"${package}::$method"} =
      sub {
	my $self = shift;
        my $rv = $backend->($self, $self->{var}, @_);
        $self->{var} = $rv if $self->{brutal};
	return @$rv if ref $rv eq 'ARRAY';
	return %$rv if ref $rv eq 'HASH';
	return $rv;
      };
    }

}




1;
