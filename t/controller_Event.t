use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Calendar';
use Calendar::Controller::Event;

ok( request('/event')->is_success, 'Request should succeed' );
done_testing();
