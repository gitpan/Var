use Test::More qw(no_plan);
use Var;

$s = var 1234;
is( $s->number_to_en(), 'One Thousand, Two-Hundred Thirty-Four');
is( $s->number_to_zh(), '一千二百三十四' );

