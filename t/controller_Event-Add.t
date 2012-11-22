use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Calendar';
use Calendar::Controller::Event::Add;

ok( request('/event/add')->is_success, 'Request should succeed' );
done_testing();
