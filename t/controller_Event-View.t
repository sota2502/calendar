use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Calendar';
use Calendar::Controller::Event::View;

ok( request('/event/view')->is_success, 'Request should succeed' );
done_testing();
