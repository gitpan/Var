use Test::More qw(no_plan);
use Var;

$a = array qw(foo bar buzzzzz);
is $a->list2re , '(?-xism:(?=[bf])(?:b(?:ar|uzzzzz)|foo))';
