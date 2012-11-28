package Calendar::Controller::Event;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Calendar::Controller::Event - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Calendar::Controller::Event in Event.');
}

sub main :Chained('/') :PathPart('event') :CaptureArgs(2) {
    my ( $self, $c, $page_id, $module_id ) = @_;

    $c->stash->{page_id} = $page_id;
    $c->stash->{module_id} = $module_id;
}

sub show :Chained('main') :PathPart('') :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body('Matched Calendar::Controller::Event in Event.');
}

=head1 AUTHOR

中森 創太

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
