use Test::More qw(no_plan);
use Var;

$a = array(qw(1 2 3 4));

is $a->size(), 4;
is $a->max(), 4;
is $a->range, 3;
is $a->mean, 2.5;
is $a->stddev, 1.11803398874989485;
is $a->sum, 10;
is $a->median, 2.5;
is $a->mode, 2.5;
is $a->variance, 1.25;
is scalar( $a->shuffle), 4;
is $a->reduce('+'), 10;
is $a->reduce('**'), 1;
is $a->join('*'), '1*2*3*4';
is scalar $a->to_array , 4;
