use Test::More qw(no_plan);
use Var;

$s = var "this is an internaational test.";
is $s->bastardize(-pig), q<isthay isway anway internaationalway esttay.>;
is $s->bastardize(-k3wlt0k), q<D1Z 1Z 3N 1N74RN33710N31 74Z7...>;
is $s->bastardize(-rot13), q<guvf vf na vagreanngvbany grfg.>;
is $s->bastardize(-censor), q<th*s is an internaational t*st.>;
is $s->bastardize(-n20e), q<this is an i12l test.>;
is $s->bastardize(-pig, -k3wlt0k, -rot13, -censor, -n20e),
    q<1M7*3L 1MJ3L 3*J3L 115L 47.>

