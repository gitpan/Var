use Test::More qw(no_plan);
use Var;

$h = hash qw(1 2 3 4);

ok(ref($h));
is(scalar $h->to_hash, '2/8');
