use Test::More qw(no_plan);
use Var;

$s = var 'this is a test.';

ok $s->crc;
ok $s->md5;
ok $s->md5_hex;
ok $s->md5_base64;
ok $s->md2;
ok $s->md2_hex;
ok $s->md2_base64;
ok $s->sha1();
ok $s->sha1_hex();
ok $s->sha1_base64();
