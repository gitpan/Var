use Test::More qw(no_plan);
use Var;

$s = var 'this is a test.';
ok $s->crypt("as");
