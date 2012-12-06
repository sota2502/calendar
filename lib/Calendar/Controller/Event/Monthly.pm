package Calendar::Controller::Event::Monthly;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use Calendar::Utils::Array;

=head1 NAME

Calendar::Controller::Event::Monthly - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Calendar::Controller::Event::Monthly in Event::Monthly.');
}

sub main :ChainedParent :PathPart('monthly') :Args(2) {
    my ( $self, $c, $year, $month ) = @_;

    my $events = $c->entity('Event')->search(
        year  => $year,
        month => $month,
    );

    my $monthly = Calendar::Utils::Array::calendar_table(
        year   => $year,
        month  => $month,
        events => $events,
    );

    $c->stash->{monthly} = $monthly;
    $c->stash->{year}    = $year;
    $c->stash->{month}   = $month;

    my ($prev_link, $next_link) = __neighbor($c, $year, $month);
    $c->stash->{prev} = $prev_link;
    $c->stash->{next} = $next_link;
}

sub __neighbor {
    my ($c, $year, $month) = @_;

    my $parent_path = sprintf '/event/%d/%d/', $c->page_id, $c->module_id;

    my $prev = sprintf 'monthly/%d/%d',
        ($month == 1) ? ($year - 1, 12) : ($year, $month - 1);
    my $next = sprintf "monthly/%d/%d",
        ($month == 12) ? ($year + 1, 1) : ($year, $month + 1);

    return ($parent_path . $prev, $parent_path . $next);
}


=head1 AUTHOR

中森 創太

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
