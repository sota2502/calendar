package Calendar;
use Moose;
use namespace::autoclean;
use Date::Calc;
use YAML::Syck;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in calendar.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'Calendar',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
);

# Start the application
__PACKAGE__->setup();

sub now {
    return sprintf '%04d-%02d-%02d %02d:%02d:%02d', Date::Calc::Today_and_Now();
}

sub page_id {
    my $c = shift;
    return $c->req->arguments->[0];
}

sub module_id {
    my $c = shift;
    return $c->req->arguments->[1];
}


sub graph_api {
    my $self = shift;

    return $self->{_graph_api} if ( defined $self->{_graph_api} );

    my $path = $self->path_to('api.yml');
    $self->{_graph_api} = eval { YAML::Syck::LoadFile($path) };
    return $self->{_graph_api};
}

=head1 NAME

Calendar - Catalyst based application

=head1 SYNOPSIS

    script/calendar_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Calendar::Controller::Root>, L<Catalyst>

=head1 AUTHOR

中森 創太

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
