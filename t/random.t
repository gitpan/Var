use Test::More qw(no_plan);
use Var;


$s = var "......";
is length $s->randomize(), 6;
