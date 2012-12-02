package Calendar::Entity::Base;
use strict;
use warnings;

use base qw/
    Class::Accessor::Fast
    Class::Data::Inheritable
/;

use Calendar::Schema;
use UNIVERSAL::require;
use Date::Calc;

sub schema {
    my ($class, $model_class) = @_;

    my $loaded = $model_class->require;
    unless ($loaded ) {
        die "Failed load $model_class";
    }

    my $connect_info = $model_class->config->{connect_info};
    return Calendar::Schema->connect(
        $connect_info->{dsn},
        $connect_info->{user},
        $connect_info->{password},
        {
            on_connect_do => $connect_info->{on_connect_do},
            AutoCommit    => $connect_info->{AutoCommit},
        },
    );
}

sub now {
    my $class = shift;
    return sprintf "%04d-%02d-%02d %02d:%02d:%02d", Date::Calc::Today_and_Now;
}

1;
