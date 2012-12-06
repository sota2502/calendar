use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Calendar';
use Calendar::Controller::Event::Monthly;

ok( request('/event/monthly')->is_success, 'Request should succeed' );
done_testing();
