use Test::More qw(no_plan);
use Var;

$string = 'perl is nifty!';
$input = var($string)->brutal(1);
ok $input->compress;
is( $input->uncompress, $string);
