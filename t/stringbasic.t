use Test::More qw(no_plan);
use Var;

$string ="   perl is nifty!    ";
$s = var($string);

is $s->chop, '   perl is nifty!   ';
is $s->reverse, '    !ytfin si lrep   ';
is $s->strip_space , 'perlisnifty!';
is $s->strip_lspace , 'perl is nifty!    ';
is $s->strip_rspace , '   perl is nifty!';

like $s->uc, qr'PERL';
is $s->length(), 21;
is $s->chomp(), $string;
is $s->chop(), "   perl is nifty!   ";
is $s->substr(3, 4), 'perl';


$s = var 1234;
is $s->concat("asdf"), '1234asdf';
is $s->append("asdf"), '1234asdf';
is $s->prepend("asdf"), 'asdf1234';
is $s->split(''), 4;
