use strict;
use warnings;

use Calendar;

my $app = Calendar->apply_default_middlewares(Calendar->psgi_app);
$app;

