use strict;
use warnings;

package Mojolicious::Plugin::Web::Auth::Site::Fitbit;

use Mojo::Base qw/Mojolicious::Plugin::Web::Auth::OAuth2/;

has response_type => 'code';
has user_info     => 0;

#has user_info_url => 'https://api.fitbit.com/1/user/-/profile.json';

sub moniker { 'fitbit' }

1;
__END__

# ABSTRACT: Fitbit OAuth Plugin for Mojolicious::Plugin::Web::Auth

=pod

=head1 SYNOPSIS

    use URI::FromHash qw( uri );
    my $key = 'foo';
    my $secret = 'seekrit';

    my $access_token_url = uri(
        scheme   => 'https',
        username => $key,
        password => $secret,
        host     => 'api.fitbit.com',
        path     => 'oauth2/token',
    );

    my $authorize_url = uri(
        scheme   => 'https',
        username => $key,
        password => $secret,
        host     => 'www.fitbit.com',
        path     => 'oauth2/authorize',
    );

    # Mojolicious
    $self->plugin(
        'Web::Auth',
        module           => 'Fitbit',
        authorize_url    => $authorize_url,
        access_token_url => $access_token_url,
        key              => $key,
        scope =>
            'activity heartrate location nutrition profile sleep social weight',
        on_finished => sub {
            my ( $c, $access_token, $access_secret ) = @_;
            ...;
        },
    );

    # Mojolicious::Lite
    plugin 'Web::Auth',
        module           => 'Fitbit',
        authorize_url    => $authorize_url,
        access_token_url => $access_token_url,
        key              => $key,
        scope =>
        'activity heartrate location nutrition profile sleep social weight',
        on_finished => sub {
        my ( $c, $access_token, $access_secret ) = @_;
        ...;
        };

    # default authentication endpoint: /auth/fitbit/authenticate
    # default callback endpoint: /auth/fitbit/callback

=head1 DESCRIPTION

This module adds L<Fitbit|https://dev.fitbit.com/docs/> support to
L<Mojolicious::Plugin::Web::Auth>.

=cut
