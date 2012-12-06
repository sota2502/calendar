package Calendar::Controller::Event;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use JSON::Syck;
use Crypt::OpenSSL::CA;
use OAuth::Lite::ServerUtil;
use Date::Calc;

my $URL = 'http://localhost:3000/event';

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

    unless ($self->has_session($c)) {
        my $session_id = $self->create_session($c);
        unless ( $session_id ) {
            $c->res->body('Failed create session');
            $c->res->status(403);
            return;
        }
    }

    my $session = $c->stash->{session};
    my ($year, $month) = Date::Calc::Today();
    my $url = sprintf "/event/%d/%d/monthly/%d/%d", $session->{mixi_page_id}, $session->{mixi_module_id}, $year, $month;
    $c->res->redirect($c->uri_for($url));
}

sub main :Chained('/') :PathPart('event') :CaptureArgs(2) {
    my ( $self, $c, $page_id, $module_id ) = @_;

    $c->stash->{page_id} = $page_id;
    $c->stash->{module_id} = $module_id;
}

sub show :Chained('main') :PathPart('') :Args(0) {
    my ( $self, $c ) = @_;

    my ($year, $month) = Date::Calc::Today();

    my $session = $c->stash->{session};
    my $url = sprintf "/event/%d/%d/monthly/%d/%d", $session->{mixi_page_id}, $session->{mixi_module_id}, $year, $month;
    $c->res->redirect($c->uri_for($url));

}

sub has_session {
    my ($self, $c) = @_;

    my $session_id = $c->sessionid;
    return 0 unless ( $session_id );

    my $resultset = $c->model('Session::Session');
    my $row = $resultset->find($session_id);
    return 0 unless ( $row );

    $c->stash->{session} = JSON::Syck::Load($row->data_json);
    return 1;
}

sub create_session {
    my ($self, $c) = @_;

    return unless ( $self->is_valid_request($c) );

    my $params = $c->req->params;
    my $json = JSON::Syck::Dump($params);

    $c->session->{oauth_signature} = $c->req->param('oauth_signature');

    my $resultset = $c->model('Session::Session');
    my $row = eval {
        $resultset->create({
            session_id => $c->sessionid,
            data_json  => $json,
        });
    };

    if ( $@ ) {
        $c->log->error($@);
        $c->delete_session;
        return;
    }

    $c->stash->{session} = $params;

    return $c->sessionid;
}

sub is_valid_request {
    my ($self, $c) = @_;

    my $ca = $c->graph_api->{cert};
    my $public_key =
      Crypt::OpenSSL::CA::X509->parse($ca)->get_public_key()->to_PEM();
    my $util = OAuth::Lite::ServerUtil->new();
    $util->support_signature_method('RSA_SHA1');

    my $ret = $util->verify_signature(
        method          => $c->req->method,
        url             => $URL,
        params          => $c->req->params,
        consumer_secret => $public_key,
    );

    return $ret ? 1 : 0;
}

sub auto :Private {
    my ( $self, $c ) = @_;
    $c->log->warn($c->sessionid);
}

=head1 AUTHOR

中森 創太

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
