use Test::More qw(no_plan);
use Var;

is(var('a')
   ->switch(
	    "a" => sub { shift }
	    )
   ->('a'), 'a');
   
